-- Task2
select student.name as name from rating
inner join student
on rating.studentid = student.id
where rating.mark > 4
group by name
order by name asc

--Task2 var
select distinct student.name as name from rating
inner join student
on rating.studentid = student.id
where rating.mark > 8

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

-- Task5
select teacher.name as name, avg(rating.mark) as rate from rating
inner join teacher
on rating.teacherid = teacher.id
group by name
order by rate desc, name
limit 5

-- Task5 if we want to get average of all top 5 teachers
with res as
(select teacher.name as name, avg(rating.mark) as rate from rating
inner join teacher
on rating.teacherid = teacher.id
group by name
order by rate desc, name
limit 5)
select avg(rate) from res

--Task6
with avr_marks as (
        select
	      avg(rating.mark) as average_mark,
	      student.name as student_name,
	      student.groupid as group_id
        from student
	inner join rating
        on student.id = rating.studentid
        group by student.id
        )
select
        res.student_name as student_name,
	res.group_name as group_name
from (
      select
            avr_marks.student_name as student_name,
            "group".name as group_name,
            rank() over (partition by "group".id order by avr_marks.average_mark  desc) as mark_rank
      from avr_marks
      inner join "group"
      on avr_marks.group_id = "group".id)
      as res
where mark_rank=1

--Task7
select distinct  student.name, rating.subject, avg(rating.mark) over (partition by student.name, rating.subject ) from rating
join student
on rating.studentid = student.id
order by student.name, rating.subject;

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

--Task8
with res as (
	select student.name as name, avg(rating.mark) as average from student
	inner join rating
	on student.id = rating.studentid
	group by (student.id)
	)
select name, 'good' as characteristics from res
where average > 7
union
select name, 'bad' as characteristics from res
where average <= 7

--Task8 var
with res as (
	select student.name as name, avg(rating.mark) as average from student
	inner join rating
	on student.id = rating.studentid
	group by (student.id)
	)

select name, (case when average > 7 then 'good' else 'bad' end) as characteristics from res

--Task9
create view intermediate as
select name, subject, mark from (
	select  distinct student.name as name, rating.subject as subject, rating.mark as mark, rank() over (partition by student.id, rating.subject order by rating.mark desc) as pos from student
	inner join rating
	on student.id = rating.studentid
	where rating.subject in ('mathematics','java','python')
) a
where pos = 1;

with res as (
	select name,
    case when intermediate.subject = 'mathematics' then intermediate.mark end as math,
	   case when intermediate.subject = 'java' then intermediate.mark end as java,
	   case when intermediate.subject = 'python' then intermediate.mark end as python
	   from intermediate
)

select name, max(math) as math, max(java) as java, max(python) as python from res
group by name
order by name


--Task10
create index if not exists name_idx on student (name)
--pros: faster search
--cons: due, "name" column is not  unique - when table will contain  lots of items with the same "names" the efficiency of index will reduce






