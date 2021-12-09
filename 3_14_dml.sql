--Task14
select "group".name as name, interm.teacher_amount as teacher_amount from(
select res.group_id as group_id, count(*) as  teacher_amount from
	(select "group".id as group_id, count(rating.teacherid) as teacher_id_count from student
	inner join rating
	on rating.studentid = student.id
	inner join "group"
	on student.groupid = "group".id
        group by "group".id, rating.teacherid) as res
      group by res.group_id) as interm
inner join "group"
on interm.group_id = "group".id






