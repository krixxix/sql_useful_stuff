/* ******************************** */
/* ***** SYBASE JOIN ANALYSIS ***** */
/* ******************************** */


/* nutno spou�t�t postupn� - z n�jak�ho mn� nezn�m�ho d�vodu */


/* ***** VYTVO�EN� TABULEK ***** */

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

INSERT INTO #student2 VALUES(6, 'Jan', '�esk� jazyk');
INSERT INTO #student2 VALUES(7, 'Barbora', 'Mal��stv�');
INSERT INTO #student2 VALUES(8, 'Pavel', 'Va�en�');
INSERT INTO #student2 VALUES(1, 'Jack', 'Biology')


---------------------------
select * from #student
select *from #student2

-- union: zobraz� pouze unik�tn� hodnoty = odebere dubplicity, n�co jako distinct
select *
from #student
union
select *
from #student2

-- union all: zobraz� ve�ker� hodnoty, v�. duplicit
select *
from #student
union all
select *
from #student2

