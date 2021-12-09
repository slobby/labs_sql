select student.name as name from rating
inner join student
on rating.studentid = student.id
group by student.id
having avg(rating.mark) > 8;
