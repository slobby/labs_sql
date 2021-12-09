--Task11   (когда средний рейтинг всех студентов вообщем в департаменте > 6)
select department.name,  avg(res.average) from (
	select student.id as studentid, student.groupid as groupid, avg(rating.mark) as average from student
	inner join rating
	on rating.studentid = student.id
	group by student.id
	) as res
	inner join "group"
	on "group".id = res.groupid
	inner join department
	on "group".depid = department.id
	group by department.id
	having avg(res.average) > 6;

--Task11   (когда средний рейтинг каждого студента в департаменте > 6)
select department.name from (
	select student.id as studentid, student.groupid as groupid, avg(rating.mark) as average from student
	inner join rating
	on rating.studentid = student.id
	group by student.id
	having avg(rating.mark) > 6
	) as res
	inner join "group"
	on "group".id = res.groupid
	inner join department
	on "group".depid = department.id
    group by department.id
