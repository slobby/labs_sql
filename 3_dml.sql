-- Task2
select student.name as name from rating
inner join student
on rating.studentid = student.id
where rating.mark > 4
group by name
order by name asc

-- Task3
select count(*) from
(select student.name as name from rating
inner join student
on rating.studentid = student.id
group by name
having avg(rating.mark) > 6) res;

-- Task3 var
with res as (
select student.name as name from rating
inner join student
on rating.studentid = student.id
group by name
having avg(rating.mark) > 6)
select count(*) from res;

-- Task4
select student.name as name from rating
inner join student
on rating.studentid = student.id
group by name
having avg(rating.mark) > 8;

-- Task5(NB. Don`t understand how to evaluate teachers rating?)
select teacher.name as name, avg(rating.mark) as rate from rating
inner join teacher
on rating.teacherid = teacher.id
group by name
order by rate desc, name
limit 5



