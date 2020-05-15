create table a1(
nm varchar2(20),
roll number,
cl number);

create table a3 as
select * from a1 where 1=2

create table a2(
nm varchar2(20),
roll number,
cl number);

drop table a3;

insert into a1 values('A',1,1);
insert into a1 values('B',1,2);
insert into a1 values('A',1,1);


insert into a2 values('C',1,1);
insert into a2 values('D',1,2);
insert into a2 values('E',1,3);

select * from a1
union 
select * from a2;

select * from a3;

create table a3 as
select * from a1 where 0=1;


select nm
,roll
,cl
from 
(
select nm as nm
,roll as roll
,class as cl 
from a1 
union 
select nm as nm
,roll as roll
,class as cl
from a2
)tb;



merge into a3 t1
using
(
/*select nm
,roll
,cl
from 
(*/
select nm as nm
,roll as roll
,cl as cl 
from a1 
/*union 
select nm as nm
,roll as roll
,cl as cl
from a2
)t1*/
)tbl
on
(t1.nm=tbl.nm,
t1.roll=tbl.roll)
when matched then 
update set 
(t1.nm=tbl.nm,
t1.roll=tbl.roll,
t1.cl=tbl.cl)
when not matched then
insert(t1.nm,t1.roll,t1.cl)
values(tbl.nm,tbl.roll,tbl.cl);


