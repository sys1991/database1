SHOW DATABASES;
USE scott;
SHOW TABLES;
# 工资 = 基本工资 + 奖金
# 1. 查找部门30中员工的详细信息。
SELECT *
FROM emp
WHERE DEPTNO = 30;
# 2. 找出从事clerk工作的员工的编号、姓名、部门号。
SELECT
  EMPNO,
  ENAME,
  DEPTNO
FROM emp
WHERE JOB = 'clerk';
# 3. 检索出奖金多于基本工资的员工信息。
SELECT ENAME
FROM emp e
WHERE e.COMM > e.SAL;
# 4. 检索出奖金多于基本工资60%的员工信息。
SELECT *
FROM emp e
WHERE e.COMM > e.SAL * 0.6;
# 5. 希望看到10部门的经理或者20部门的职员(clerk)的信息。
SELECT *
FROM emp
WHERE (DEPTNO = 10
       AND JOB = 'MANAGER')
      OR (DEPTNO = 20
          AND JOB = 'CLERk');
# 6. 找出10部门的经理、20部门的职员或者既不是经理也不是职员但是高于2000元的员工信息。
SELECT *
FROM emp
WHERE ((DEPTNO = 10 AND JOB = 'MANAGER') OR (DEPTNO = 20 AND JOB = 'CLERk'))
      OR (DEPTNO IN (10, 20) AND JOB NOT IN ('manager', 'clerk') AND SAL + ifnull(COMM, 0) > 2000);
# 7. 找出获得奖金的员工的工作。
SELECT *
FROM emp
WHERE ifnull(COMM, 0) > 0;
# 8. 找出奖金少于100或者没有获得奖金的员工的信息。
SELECT *
FROM emp
WHERE ifnull(COMM, 0) BETWEEN 0 AND 100;
# 9. 查找员工雇佣日期中当月的最后一天雇佣的。

# 10. 检索出雇佣年限超过12年的员工信息。
SELECT now() - HIREDATE
FROM emp
;
# 11. 找出姓名以A、B、S开始的员工信息。
SELECT *
FROM emp
WHERE ENAME RLIKE '^[abc]';
# 12. 找到名字长度为7个字符的员工信息。

# 13. 名字中不包含R字符的员工信息。
SELECT *
FROM emp;
SELECT *
FROM emp
WHERE ENAME NOT LIKE '%r%';
# 14. 找出员工名字的前3个字符。
SELECT substr(ENAME, 1, 3)
FROM emp;
# 15. 将名字中A改为a。

# 16. 将员工的雇佣日期拖后10年。
# 17. 返回员工的详细信息并按姓名排序。
SELECT *
FROM emp
ORDER BY ENAME;
# 18. 返回员工的信息并按员工的工作年限降序排列。
SELECT *
FROM emp
ORDER BY HIREDATE;
# 19. 返回员工的信息并按工作降序工资升序排列。
SELECT *
FROM emp
ORDER BY SAL;
# 20. 返回员工的姓名、雇佣年份和月份并且按月份和雇佣日期排序。
# 21. 计算员工的日薪(按30天)。
SELECT
  ename,
  round((SAL + ifnull(COMM, 0)) / 30,2)
FROM emp;
# 22. 找出2月份雇佣的员工。
# 23. 至今为止，员工被雇佣的天数。
# 24. 找出姓名中包含A的员工信息。
SELECT *
FROM emp
WHERE ENAME LIKE '%a%';
# 25. 计算出员工被雇佣了多少年、多少月、多少日。
