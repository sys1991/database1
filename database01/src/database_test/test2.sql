CREATE DATABASE 孙屹松网上购书;
USE 孙屹松网上购书;
SHOW DATABASES;
-- 用户信息表。
CREATE TABLE user (
  id        INT(11) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name      VARCHAR(255),
  tel       INT(11),
  address   VARCHAR(2048),
  email     VARCHAR(1024),
  vip_grade INT(1)
);

DESC user;
-- 图书信息表。
CREATE TABLE book (
  id        INT(11) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name      VARCHAR(255),
  author    VARCHAR(255),
  chubanshe VARCHAR(1024),
  date      VARCHAR(1024),
  class     VARCHAR(1024),
  price     DOUBLE(11, 2)
);
DESC book;
-- 图书订单表。
CREATE TABLE dingdan (
  id       INT(11) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  book_id  INT(11) UNSIGNED,
  CONSTRAINT fk_book_id FOREIGN KEY (book_id) REFERENCES book (id),
  user_id  INT(11)UNSIGNED,
  CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES user (id),
  number   INT(5),
  zhekou   DOUBLE(2, 1),
  buytime  VARCHAR(255),
  songtime VARCHAR(255)
);
-- 插入用户信息
INSERT INTO user (name, tel, address, email, vip_grade) VALUES ('张三', 111111111, '北京市海淀区清华大学', '123@qq.com', 5);
INSERT INTO user (name, tel, address, email, vip_grade) VALUES ('李四', 222222222, '北京市海淀区清华大学', '456@qq.com', 2);
SELECT *
FROM user;

-- 插入图书信息
INSERT INTO book (name, author, chubanshe, date, class, price)
VALUES ('JAVA入门到精通', '小白', '清华大学', '2010-9-9', 'JAVA-J2EE', 99.99);
INSERT INTO book (name, author, chubanshe, date, class, price)
VALUES ('MYsql', '小新', '清华大学', '2010-2-9', 'JAVA-J2EE', 87.00);
SELECT *
FROM book;

-- 插入订单信息
INSERT INTO dingdan (book_id, user_id, number, zhekou, buytime, songtime) VALUES (2, 1, 1, 0.5, '2016-1-1', '2016-1-2');
SELECT *
FROM dingdan;

-- (3)
SELECT
  u.name,
  b.name,
  d.number,
  d.buytime
FROM dingdan d, book b, user u
WHERE d.book_id = b.id AND d.user_id = u.id;

-- (4)
SELECT *
FROM book
  LEFT JOIN dingdan
    ON book.id = dingdan.book_id;

-- (6)
SELECT
  u.name,
  b.name,
  d.number,
  d.buytime
FROM dingdan d, book b, user u
WHERE u.name =? AND d.book_id = b.id AND d.user_id = u.id;

-- (7)
CREATE VIEW shitu AS
  SELECT
    d.id AS '订单id',
    b.name AS '书名',
    u.name AS '客户姓名',
    d.number AS '数量',
    d.buytime AS '购买时间',
    d.songtime AS '送货时间'
  FROM dingdan d, book b, user u
  WHERE u.id=? AND d.book_id=b.id AND d.user_id=u.id;
DROP VIEW shitu;

-- (8)
-- 没有执行以下操作，请慎重执行
DELETE FROM book
WHERE id=1;


SELECT *
FROM dingdan;

