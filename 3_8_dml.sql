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
