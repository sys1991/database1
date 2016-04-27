SHOW DATABASES;
CREATE DATABASE third;
USE third;
CREATE TABLE students (
  id      INT(11) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name    VARCHAR(255),
  kecheng VARCHAR(255),
  fenshu  INT(3)
);
DROP TABLE students;
DESC students;
SELECT *
FROM students;
INSERT INTO students (name, kecheng, fenshu) VALUES ('张三', '语文', 81);
INSERT INTO students (name, kecheng, fenshu) VALUES ('张三', '数学', 75);
INSERT INTO students (name, kecheng, fenshu) VALUES ('李四', '语文', 56);
INSERT INTO students (name, kecheng, fenshu) VALUES ('李四', '数学', 90);
INSERT INTO students (name, kecheng, fenshu) VALUES ('王五', '语文', 81);
INSERT INTO students (name, kecheng, fenshu) VALUES ('王五', '数学', 100);
INSERT INTO students (name, kecheng, fenshu) VALUES ('王五', '英语', 40);

-- (1)找出至少有一门课成绩的学生名单。
SELECT  name
FROM students
GROUP BY name HAVING count(kecheng)>1;

-- (2)找出平均分比全班平均分高的学生
SELECT *
FROM students
GROUP BY name
HAVING avg(fenshu) > (SELECT avg(fenshu)
                      FROM students
);

-- (3)找出至少有一门课成绩大于80的学生
SELECT *
FROM students
WHERE fenshu > 80;

-- (4)找出各门课程的最低分学生
SELECT *
FROM students
GROUP BY kecheng
HAVING min(fenshu);
-- (5)列出所有学生都及格的课程

SELECT kecheng
FROM students
GROUP BY kecheng HAVING min(fenshu)>60;