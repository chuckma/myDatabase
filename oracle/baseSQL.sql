-- SELECT (ENAME || ' is a ' || JOB) AS "Employee Details" FROM EMP WHERE SAL >2000

-- SELECT ename,sal,(sal*12+2000) AS salsum FROM EMP WHERE SAL >2000;

-- SELECT DISTINCT DEPTNO FROM EMP;

-- SELECT ename,job,sal,comm FROM EMP WHERE sal <2000; -- NULL值

-- SELECT ename,job,sal,comm FROM EMP WHERE SAL <2000 AND COMM IS NULL;	-- EMP 中没发奖金的

-- SELECT ename,job,sal,comm FROM EMP WHERE job IN ('SALESMAN', 'PRESIDENT', 'ANALYST');		-- IN 操作符用来查询列值在指定的列表中的行

-- SELECT ename,job,sal FROM EMP WHERE sal BETWEEN 1000 AND 2000;	-- BETWEEN 操作符查询列值包含在指定区间的行

-- SELECT ENAME,JOB,SAL FROM EMP WHERE ENAME LIKE 'A%LL%';			-- LIKE 模糊查询 '%SS%', 'A%','%A'

-- SELECT e.ENAME,e.JOB,e.SAL,d.DNAME FROM EMP e INNER JOIN DEPT d ON e.DEPTNO=d.DEPTNO WHERE e.SAL>2000 		-- 工资大于 2000 元的，员工姓名，部门，工作，工资。

-- SELECT  e.ENAME,e.job,e.SAL,d.DNAME FROM EMP e,DEPT d WHERE e.DEPTNO=d.DEPTNO AND e.SAL>2000;

-- SELECT e.ENAME,e.JOB,e.SAL,d.DNAME FROM EMP e RIGHT OUTER JOIN DEPT d ON e.DEPTNO=d.DEPTNO	-- SQL/92 标准右连接

-- 显示能获得与 Scott 一样工资和奖金的其他雇员的姓名、受雇日期以及工资。
-- SELECT * FROM EMP WHERE (SAL,NVL(COMM,0))=(SELECT SAL,NVL(COMM,0) FROM EMP WHERE ENAME='SCOTT'); 



-- 子查询

-- 查询 销售部门SALES 下的员工信息  (单行子查询)
-- SELECT ename,job,sal FROM EMP WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE dname='SALES');

-- 查询出 Emp 表中比任意一个销售员(“SALESMAN”)工资低的员工姓名、工作、工资。(ANY子查询)
-- SELECT ename ,job,sal from emp WHERE SAL < ANY (SELECT SAL FROM EMP WHERE job = 'SALESMAN');

-- oracle sql 分页 
-- SELECT *FROM (SELECT ROWNUM r,ename,job,sal FROM EMP WHERE ROWNUM<=10 ) where r > 5;

--------------------------oracle sql 优化改写------------------------------------

-- 多表插入语句
-- CREATE TABLE emp1 AS SELECT empno,ename,job from emp where 1 =2;
-- CREATE TABLE emp2 AS SELECT empno,ename,deptno from emp where 1 =2;
-- 无条件插入
-- INSERT ALL
-- 	INTO emp1(empno,ename,job)VALUES(empno,ename,job)
-- 	INTO emp2(empno,ename,deptno)VALUES(empno,ename,deptno)
-- SELECT empno,ename,job,deptno FROM emp WHERE deptno IN(10,20);
-- 条件插入
-- INSERT ALL
-- WHEN job IN ('SALESMAN','MANAGER')THEN
-- INTO emp1(empno,ename,job)VALUES (empno,ename,job)
-- WHEN deptno IN('20','30')THEN
-- INTO emp2(empno,ename,deptno)VALUES (empno,ename,deptno)
-- SELECT empno,ename,job,deptno FROM emp;

-- 多字段排序
SELECT empno,deptno,sal,ename,job FROM emp ORDER BY 2 ASC ,3 DESC;