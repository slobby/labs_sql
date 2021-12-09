select teacher.name as name, avg(rating.mark) as rate from rating
inner join teacher
on rating.teacherid = teacher.id
group by teacher.id
order by rate desc
limit 5


-- Task5 if we want to get average of all top 5 teachers
with res as
(select teacher.name as name, avg(rating.mark) as rate from rating
inner join teacher
on rating.teacherid = teacher.id
group by name
order by rate desc
limit 5)
select avg(rate) from res