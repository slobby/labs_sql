--Task13
create temp table high_achiever(
id serial primary key,
student_name varchar(30),
high_achiever_subject varchar(30)
);

create view intermediate as
select subject, name, student_id, mark from (
select rating.subject as subject, student.name as name, student.id as student_id, rating.mark as mark, rank() over (partition by rating.subject order by rating.mark desc) as rank_order from rating
inner join student
on rating.studentid = student.id) a
where rank_order = 1;

-- select * from intermediate

-- drop view intermediate

insert into high_achiever(student_name, high_achiever_subject)
select name, subject from intermediate
where subject = 'chemistry'
union
select name, subject from intermediate
where subject = 'java'
union
select name, subject from intermediate
where subject = 'history';

select * from high_achiever
order by high_achiever_subject;
