--Task7
select distinct  student.name, rating.subject, avg(rating.mark) over (partition by student.id, rating.subject ) from rating
join student
on rating.studentid = student.id
order by student.id, rating.subject;

--Task7 var 1
with res as (
select student.name as name, rating.subject as subject, avg(rating.mark) over (partition by student.name, rating.subject ) as average from rating
join student
on rating.studentid = student.id
order by student.name, rating.subject)
select name, subject, avg(average) from res
group by name, subject;

--Task7 var 2
with res as (
select student.name as name, rating.subject as subject, avg(rating.mark) over (partition by student.name, rating.subject ) as average from rating
join student
on rating.studentid = student.id
order by student.name, rating.subject
)
select name, subject, average from (select *, row_number() over(partition by  name, subject order by average) as row_num  from res) a
where row_num=1
