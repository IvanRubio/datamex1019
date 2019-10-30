#CHALLENGE 1
SELECT au.au_id as AUTHOR_ID, au.au_lname AS LAST_NAME, au.au_fname AS FIRST_NAME, t.title AS TITLE, pu.pub_name AS PUBLISHER
FROM authors au
INNER JOIN titleauthor titaut
ON titaut.au_id=au.au_id
INNER JOIN titles t
ON t.title_id=titaut.title_id
INNER JOIN publishers pu
ON pu.pub_id=t.pub_id;

#CHALLENGE 2
select AUTHOR_ID, LAST_NAME, FIRST_NAME, PUBLISHERS, count(title) as COUNT_TITLES from(
SELECT au.au_id as AUTHOR_ID, au.au_lname as LAST_NAME, au.au_fname as FIRST_NAME, t.title as TITLE, 
pu.pub_name as PUBLISHERS
from 
authors as au
left join titleauthor as ti
on au.au_id = ti.au_id
inner join titles t
on ti.title_id=t.title_id
inner join publishers pu
on t.pub_id= pu.pub_id)
group by AUTHOR_ID, PUBLISHERS
order by COUNT_TITLES desc;

#CHALLENGE 3
select au.au_id, au.au_lname, au.au_fname, sum(s.qty) as TOTAL
from authors au
INNER JOIN titleauthor titaut
ON titaut.au_id=au.au_id
INNER JOIN sales s
ON s.title_id=titaut.title_id
GROUP BY au.au_id, s.title_id
ORDER BY TOTAL DESC
LIMIT 3;

#CHALLENGE 4
select au.au_id, au.au_lname, au.au_fname, sum(s.qty) as TOTAL
from authors au
INNER JOIN titleauthor titaut
ON titaut.au_id=au.au_id
INNER JOIN sales s
ON s.title_id=titaut.title_id
GROUP BY au.au_id, s.title_id
ORDER BY TOTAL DESC
LIMIT 23;



