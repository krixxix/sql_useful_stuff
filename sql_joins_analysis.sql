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

-------- TABLE 2: Student IDs, surnames & sex
CREATE TABLE #additional (
	student_id INT,
	last_name VARCHAR(20),
	sex VARCHAR(1)
);

INSERT INTO #additional VALUES(1, 'Sparrow', 'M');
INSERT INTO #additional VALUES(2, 'Black', 'F');
INSERT INTO #additional VALUES(3, 'Orange', 'F');
INSERT INTO #additional VALUES(4, 'Blue', 'M');
INSERT INTO #additional VALUES(5, 'Red', 'M');
INSERT INTO #additional VALUES(6, 'Jolanda', 'F');

-------- TABLE 3: Student IDs & age
CREATE TABLE #age (
	student_id INT,
	age INT
);

INSERT INTO #age VALUES(1, 15);
INSERT INTO #age VALUES(3, 17);
INSERT INTO #age VALUES(4, 12);


/* ***** ZOBRAZENÍ TABULEK ***** */

SELECT *
FROM #student

SELECT *
FROM #additional

SELECT *
FROM #age


/* ***** JOIN ANALYSIS ***** */

-- a) JOIN
SELECT a.first_name, b.last_name
FROM #student AS a
JOIN #additional AS b ON a.student_id = b.student_id;
	-- levá tabulka 5 øádkù
	-- pravá tabulka 6 øádkù
		-- vypsány pouze hodnoty, které mají shodné student_id v obou datasetech

SELECT a.first_name, b.age
FROM #student AS a
JOIN #age AS b ON a.student_id = b.student_id;
	-- levá tabulka 5 øádkù
	-- pravá tabulka 3 øádky
		-- vypsány pouze hodnoty, které mají shodné student_id v obou datasetech

SELECT a.last_name, b.age
FROM #additional AS a
JOIN #age AS b ON a.student_id = b.student_id
	-- levá tabulka 6 øádkù
	-- pravá tabulka 3 øádky
		-- vypsány pouze hodnoty, které mají shodné student_id v obou datasetech


-- b) LEFT JOIN
SELECT a.first_name, b.last_name
FROM #student AS a
LEFT JOIN #additional AS b ON a.student_id = b.student_id;
	-- levá tabulka 5 øádkù
	-- pravá tabulka 6 øádkù

SELECT a.first_name, b.age
FROM #student AS a
LEFT JOIN #age AS b ON a.student_id = b.student_id;
	-- levá tabulka 5 øádkù
	-- pravá tabulka 3 øádky

SELECT a.last_name, b.age
FROM #additional AS a
LEFT JOIN #age AS b ON a.student_id = b.student_id
	-- levá tabulka 6 øádkù
	-- pravá tabulka 3 øádky

-- c) RIGHT JOIN
SELECT a.first_name, b.last_name
FROM #student AS a
RIGHT JOIN #additional AS b ON a.student_id = b.student_id;
	-- levá tabulka 5 øádkù
	-- pravá tabulka 6 øádkù

SELECT a.first_name, b.age
FROM #student AS a
RIGHT JOIN #age AS b ON a.student_id = b.student_id;
	-- levá tabulka 5 øádkù
	-- pravá tabulka 3 øádky

SELECT a.last_name, b.age
FROM #additional AS a
RIGHT JOIN #age AS b ON a.student_id = b.student_id
	-- levá tabulka 6 øádkù
	-- pravá tabulka 3 øádky



/* ***** VYMAZÁNÍ TABULEK ***** */

DROP TABLE #student;
DROP TABLE #additional;
DROP TABLE #age;




------------------- další experiemty

@export { "type": "csv", "producer": {}, "consumer": { "outputFolder":"C:\\Users\\jf16783\\Desktop\\asd", "outputFilePattern":"output"}, "processor": {"extension":"csv", "delimiter":"|"} SELECT * FROM #student

@export {SELECT * FROM #student} -- asi nepofachèí


CREATE TABLE #experiment (
	c_poj_sml INT,
	rod_cis INT,
	kod_pojisteni_popis VARCHAR(20),
	dej_nazev VARCHAR(20)
	);

INSERT INTO #experiment VALUES(123555888, 333444555, 'Pojisteni zavazadel', 'Zpozdeni zavazadel');
INSERT INTO #experiment VALUES(123555888, 333444555, 'Pojisteni zavazadel', 'Ukradeni zavazadel');
INSERT INTO #experiment VALUES(123555888, 222111555, 'Pojisteni LV', 		'Osetreni lekarem');
INSERT INTO #experiment VALUES(123666999, 111444999, 'Pojisteni odp',		'Odpovednost za ujmu');
INSERT INTO #experiment VALUES(123666999, 999555111, 'Pojisteni odp',		'Odpovednost za ujmu');

select *
from #experiment

select c_poj_sml, count(distinct rod_cis)
from #experiment
group by c_poj_sml


drop table #experiment

--------------------------------------------------------


