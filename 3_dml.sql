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

--Task6
with avr_marks as (
select
	avg(rating.mark) as average_mark,
	student.name as student_name,
	student.groupid as group_id from student

	inner join rating
        on student.id = rating.studentid
        group by student.id)

select
        res.student_name as student_name,
	res.group_name as group_name from (

        select avr_marks.student_name as student_name,
	     "group".name as group_name,
	     rank() over (partition by "group".id order by avr_marks.average_mark) as mark_rank
	     from avr_marks

        inner join "group"
        on avr_marks.group_id = "group".id) as res
 	where mark_rank=1

--Task7
select student.name, rating.subject, avg(rating.mark) over (partition by student.id order by rating.subject ) from rating
join student
on rating.studentid = student.id;

-- select student.name, rating.subject, rating.mark from rating
-- join student
-- on rating.studentid = student.id
-- order by student.name






