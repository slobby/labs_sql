-- Task2
select student.name as name from rating
inner join student
on rating.studentid = student.id
where rating.mark > 4
group by student.id
order by name asc

--Task2 var
select distinct student.name as name from rating
inner join student
on rating.studentid = student.id
where rating.mark > 4
order by name asc