
Mi primer intento fue con un archivo .csv con información de restaurantes de 31 ciudades de Europa con datos obtenidos de Trip Advisor con las siguientes columnas:

RestaurantID
Name
City
Cuisine Style
Ranking
Rating
Price Range
Number of Reviews
Reviews
URL_TA
ID_TA

Aquí pude hacer scraping del sitio de TripAdvisor pero no pude obtener a tiempo en mi correo el token de la API.


Mi segundo intento fue con un archivo .csv con información de alojamientos de AirBnb en la Ciudad de México, teniendo las siguientes columnas:

id	
name	
host_id	
host_name	
neighbourhood	
latitude	
longitude	
room_type	
price	
minimum_nights	
number_of_reviews	
last_review	
reviews_per_month	
calculated_host_listings_count	
availability_365

A partir de aquí, conseguí información de tours en AirBnb en la Ciudad de México mediante scraping en su sitio web con el siguiente código:


import requests
import csv
from bs4 import BeautifulSoup

def preparaDatos(url):
    info=[]
    html = requests.get(url)
    soup = BeautifulSoup(html.text, 'html.parser')
    #nombres de los eventos en CDMX...
    eventos = soup.find_all('div', attrs={'class': '_1r2d8bf'})
    #precios de los eventos en CDMX...
    precios = soup.find_all('li', attrs={'class': '_g86r3e'})
    for e in eventos:
        info.append(e.text)
    return info


##Limitaciones:

No pude hacer scraping en la API de AirBnb porque es muy restrictiva y necesito preautorización. Pero intenté obtener información de eventos en la Ciudad de México en una API pública del sitio: https://www.eventbrite.com
Logré tener conexión exitosa a la API con el siguiente código:

import json
import requests

api_token = '3WK4X64LFTY5MQKBZQWA'
api_url_base = 'https://www.eventbriteapi.com/v3/users/me/?token='
headers = {'Content-Type': 'application/json',
           'Authorization': 'Bearer {0}'.format(api_token)}

def get_account_info():
    api_url = '{0}account'.format(api_url_base)
    response = requests.get(api_url, headers=headers)
    if response.status_code == 200:
        return json.loads(response.content.decode('utf-8'))
    else:
        return None
        account_info = get_account_info()
    
print(get_account_info())
