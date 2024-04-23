INSERT INTO emp(empno, ename, job, mgr) VALUES(2020, "myname", "tambay", 
    (SELECT empno FROM emp AS e WHERE job="PRESIDENT"
));

--

INSERT INTO dept VALUES (60, "HR", "MIAMI"), (70, "CUST SERVICE", "LA");
SELECT * FROM dept;

--

INSERT INTO bonus(ename, job, sal, comm) SELECT ename, job, sal, comm FROM emp;

--

UPDATE dept SET dname="FINANCE" WHERE dname="ACCOUNTING";

--

UPDATE emp SET sal=sal*1.1 WHERE job="CLERK";

--

DELETE FROM dept WHERE deptno IN (10);

--

DELETE FROM dept WHERE 
    deptno NOT IN (SELECT DISTINCT deptno from emp WHERE deptno IS NOT NULL);