create database task1;

create table if not exists department (
       id serial primary key,
       name varchar(30)
);

create table if not exists "group" (
       id serial primary key,
       name varchar(30),
       depId int references department (id) on delete set null
);

create table if not exists student (
       id serial primary key,
       name varchar(40),
       groupId int references "group" (id) on delete set null
);

create table if not exists teacher (
       id serial primary key,
       name varchar(30)
);

create table if not exists rating (
       id serial primary key,
       mark int,
       subject varchar(30),
       teacherId int,
       studentId int,
       foreign key (teacherId) references teacher (id) on delete cascade,
       foreign key (studentId) references student (id) on delete cascade,
       constraint CK_rating_mark check((mark >0 and mark <=10))
);