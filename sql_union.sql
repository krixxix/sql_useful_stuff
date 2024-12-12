/* ******************************** */
/* ***** SYBASE JOIN ANALYSIS ***** */
/* ******************************** */


/* nutno spouštìt postupnì - z nìjakého mnì neznámého dùvodu */


/* ***** VYTVOØENÍ TABULEK ***** */

-------- TABLE 1: student IDs, names & their major subject
CREATE TABLE #student (
	student_id INT,
	first_name VARCHAR(20),
	major VARCHAR(20),
	PRIMARY KEY(student_id)
);

INSERT INTO #student VALUES(1, 'Jack', 'Biology');
INSERT INTO #student VALUES(2, 'Kate', 'Sociology');
INSERT INTO #student VALUES(3, 'Claire', 'English');
INSERT INTO #student VALUES(4, 'Jack', 'Biology');
INSERT INTO #student VALUES(5, 'Mike', 'Comp. Sci');

-------- TABLE 2: Student 2
CREATE TABLE #student2 (
	student_id INT,
	first_name VARCHAR(20),
	major VARCHAR(20),
	PRIMARY KEY(student_id)
);

INSERT INTO #student2 VALUES(6, 'Jan', 'Èeský jazyk');
INSERT INTO #student2 VALUES(7, 'Barbora', 'Malíøství');
INSERT INTO #student2 VALUES(8, 'Pavel', 'Vaøení');
INSERT INTO #student2 VALUES(1, 'Jack', 'Biology')


---------------------------
select * from #student
select *from #student2

-- union: zobrazí pouze unikátní hodnoty = odebere dubplicity, nìco jako distinct
select *
from #student
union
select *
from #student2

-- union all: zobrazí veškeré hodnoty, vè. duplicit
select *
from #student
union all
select *
from #student2

