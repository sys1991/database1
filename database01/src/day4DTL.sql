USE scott;
SELECT *
FROM emp;
-- 以下是开启一次事务
START TRANSACTION ;
-- 以下是DML语句
DELETE FROM emp WHERE ENAME='king';
-- 以下是设置保留点a
SAVEPOINT a;
-- 以下是DML语句
UPDATE emp SET ENAME = 'asdfasdf' WHERE EMPNO=7788;
-- 以下是设置保留点b
SAVEPOINT b;
-- 以下是DML语句
DELETE FROM emp;
-- 以下两条是 回滚到保留点语句
ROLLBACK TO b;
ROLLBACK TO a;

-- 以下两条是显式结束事务语句，ROLLBACK是回滚到事务开始的位置并结束。COMMIT是提交并结束。
ROLLBACK ;
COMMIT ;
-- 以下是DDL语句，是隐式结束事务语句，等同于显示结束语句的COMMIT。
CREATE TABLE test(
  id int (11) UNSIGNED AUTO_INCREMENT PRIMARY KEY
);