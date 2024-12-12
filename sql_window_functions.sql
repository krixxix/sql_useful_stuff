create table #ahoj (emp_no int, department varchar(25), salary real);

insert into #ahoj values(1, 'engineering', 80000);
insert into #ahoj values(2, 'engineering', 69000);
insert into #ahoj values(3, 'engineering', 70000);
insert into #ahoj values(4, 'engineering', 103000);
insert into #ahoj values(5, 'engineering', 67000);
insert into #ahoj values(6, 'engineering', 89000);
insert into #ahoj values(7, 'engineering', 91000);

insert into #ahoj values(8,  'sales', 59000);
insert into #ahoj values(9,  'sales', 70000);
insert into #ahoj values(10, 'sales', 159000);
insert into #ahoj values(11, 'sales', 72000);
insert into #ahoj values(12, 'sales', 60000);
insert into #ahoj values(13, 'sales', 61000);
insert into #ahoj values(14, 'sales', 61000);


select * from #ahoj

select department, avg(salary) as avg_salary
from #ahoj
group by department

select department, avg(salary) over()
from #ahoj

select department, avg(salary) over(partition by department)
from #ahoj

select department, count(salary)
from #ahoj
group by department
