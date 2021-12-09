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

