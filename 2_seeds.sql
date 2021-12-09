insert into department
        (id, name)
    values
        (1,'department1'),
		(2,'department2'),
		(3,'department3');

insert into "group"
        (id, name, depid)
    values
        (1,'group1',1),
		(2,'group2',3),
		(3,'group3',2),
		(4,'group4',2),
		(5,'group5',2),
		(6,'group6',1);

insert into student
        (id, name, groupid)
    values
        (1,'student1',1),
		(2,'student2',2),
		(3,'student3',3),
		(4,'student4',4),
		(5,'student5',5),
		(6,'student6',6),
		(7,'student7',1),
		(8,'student8',2),
		(9,'student9',3),
		(10,'student10',4),
		(11,'student11',5),
		(12,'student12',6);

insert into teacher
        (id, name)
    values
        (1,'teacher1'),
		(2,'teacher2'),
		(3,'teacher3'),
		(4,'teacher4'),
		(5,'teacher5'),
		(6,'teacher6');

insert into rating
        (mark, subject, studentid, teacherid)
    values
                (5, 'mathematics', 1, 1),
                (8, 'java', 1, 6),
                (7, 'python', 1, 4),
                (6, 'english', 1, 5),
                (5, 'java', 3, 1),
                (7, 'physics', 2, 1),
		(8, 'chemistry', 2, 2),
                (7, 'python', 3, 2),
		(9, 'history', 3, 4),
		(7, 'java', 5, 3),
                (4, 'mathematics', 4, 6),
                (5, 'python', 3, 1),
                (4, 'java', 9, 3),
                (5, 'english', 4, 2),
		(6, 'physics', 5, 1),
                (5, 'python', 8, 6),
                (3, 'java', 10, 5),
                (7, 'chemistry', 3, 3),
		(8, 'mathematics', 6, 3),
		(4, 'java', 11, 2),
                (9, 'english', 12, 4),
                (9, 'python', 4, 2),
                (3, 'physics', 9, 5),
		(5, 'java', 3, 4),
                (6, 'chemistry', 11, 5),
                (5, 'python', 3, 1),
                (7, 'java', 2, 5),
                (5, 'mathematics', 10, 4),
		(4, 'english', 8, 3),
		(3, 'physics', 7, 6),
		(9, 'python', 7, 4),
                (8, 'chemistry', 7, 1);
                (7, 'mathematics', 1, 4),
                (5, 'java', 1, 3),
                (9, 'python', 1, 6),
                (9, 'english', 1, 2),
                (4, 'physics', 2, 3),
		(5, 'chemistry', 2, 1),
                (8, 'java', 2, 3),