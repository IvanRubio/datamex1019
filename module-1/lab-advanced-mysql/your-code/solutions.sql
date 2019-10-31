select sum(rs.royalty) totalRoyalty, rs.title_id
from roysched rs
group by rs.title_id

#CHALLENGE_1
#sales_royalty = titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100
select price*cant*roy/100*royaltyper/100 as sales_royalty, title_id, au_id 
from (select t.price as price, s.qty as cant, titaut.royaltyper royaltyper, t.royalty as roy, t.title_id as title_id, titaut.au_id as au_id
from titles t
inner join titleauthor titaut on t.title_id=titaut.title_id
inner join sales s on s.title_id=t.title_id) datos;

#step2
create temporary table publications.royalties
select price*cant*roy/100*royaltyper/100 as sales_royalty, title_id, au_id 
from (select t.price as price, s.qty as cant, titaut.royaltyper royaltyper, t.royalty as roy, t.title_id as title_id, titaut.au_id as au_id
from titles t
inner join titleauthor titaut on t.title_id=titaut.title_id
inner join sales s on s.title_id=t.title_id) datos;

select sum(sales_royalty) as AggRoyalties, title_id, au_id
from publications.royalties
group by title_id, au_id;

#step3
select sum(sales_royalty+advance) as totalProfit, title_id, au_id 
from totalRoyalties
group by au_id, title_id
order by totalProfit desc
limit 3;

#CHALLENGE_2
select sum(sales_royalty+advance) as totalProfit, title_id, au_id 
from(select price*cant*roy/100*royaltyper/100 as sales_royalty, title_id, au_id, advance
from (select t.price as price, s.qty as cant, titaut.royaltyper royaltyper, t.royalty as roy, t.title_id as title_id, titaut.au_id as au_id, t.advance as advance
from titles t
inner join titleauthor titaut on t.title_id=titaut.title_id
inner join sales s on s.title_id=t.title_id) datos) royalties
group by au_id, title_id
order by totalProfit desc
limit 3;

#CHALLENGE_3
CREATE TABLE most_profiting_authors SELECT sum(sales_royalty+advance) as totalProfit, au_id 
from(select price*cant*roy/100*royaltyper/100 as sales_royalty, title_id, au_id, advance
from (select t.price as price, s.qty as cant, titaut.royaltyper royaltyper, t.royalty as roy, t.title_id as title_id, titaut.au_id as au_id, t.advance as advance
from titles t
inner join titleauthor titaut on t.title_id=titaut.title_id
inner join sales s on s.title_id=t.title_id) datos) royalties
group by au_id
order by totalProfit desc;