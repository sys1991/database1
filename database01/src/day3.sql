SHOW DATABASES;
USE scott;
SHOW TABLES;
-- like 模糊查询。
SELECT *
FROM emp;

SELECT *
FROM emp
WHERE ENAME
      LIKE 'a%';

SELECT *
FROM emp
WHERE ENAME
      LIKE '%a%';
SELECT *
FROM emp
WHERE ENAME
      LIKE 'a____';

SELECT
  e.ENAME,
  e.DEPTNO,
  d.DNAME
FROM emp e
  JOIN dept d
    ON e.DEPTNO = d.DEPTNO;

SELECT
  e.ENAME,
  e.DEPTNO,
  d.DNAME
FROM emp e
  LEFT JOIN dept d
    ON e.DEPTNO = d.DEPTNO;
-- 一下语句用于表的备份

DROP TABLE IF EXISTS emp_2;
CREATE TABLE emp_2
  SELECT ENAME,SAL,COMM
  FROM emp;

SELECT *
FROM emp_2;


TRUNCATE TABLE emp_2;


INSERT INTO emp_2(ENAME,SAL,COMM) SELECT ENAME,SAL,COMM
FROM emp;




