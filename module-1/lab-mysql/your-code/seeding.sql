INSERT INTO cars (vin, manufacturer, model, year, color,fk_invoice)
VALUES ('3K096I98581DHSNUP', 'Volkswagen', 'Tiguan', 2019, 'Blue', 1);

INSERT INTO customers (customerID, name, phone, email, address, city, state, country, zipcode)
VALUES ('10001', 'Pablo Picasso', 346361763, 'hola@hola.com', 'Paseo de la Chopera, 14', 'Madrid', 'Madrid', 'Spain', 28045);

INSERT INTO salespersons(staffID, name, store)
VALUES ('00001', 'Petey Cruiser', 'Madrid');

INSERT INTO invoices(invoiceID, date, fk_car, fk_customer, fk_staff)
VALUES ('852399038', '2018-01-01', 1, 1, 1);



