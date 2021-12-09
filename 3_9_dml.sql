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








