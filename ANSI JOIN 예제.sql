CREATE TABLE board_user (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(20) NOT NULL,
    location VARCHAR(10) NOT NULL
);
SELECT * FROM board_user;
CREATE TABLE post (
    id INT AUTO_INCREMENT PRIMARY KEY,
    board_user_id INT,
    posted_at DATETIME DEFAULT NOW(),
    content VARCHAR(255)
);
SELECT * FROM post;

INSERT INTO board_user (username, location) VALUES
  ('sorbet0231', '서울'),
  ('landia92', '서울'),
  ('sungwoo7180', '울산'),
  ('msak1234', '런던'),
  ('yuop1022', '로마'),
  ('nucon84', '로마');
INSERT INTO post (board_user_id, content) VALUES
  (1, '안녕하세요 반갑습니다.'),
  (2, '저는 2번 유저입니다.'),
  (3, '일기입니다.'),
  (4, '방명록입니다.'),
  (5, '이것은 오늘 아침 뉴스 요약입니다.'),
  (2, '오늘의 날씨 안내합니다.'),
  (4, '오늘의 교통정보입니다.'),
  (5, '즐거운 주말 보내세요'),
  (1, '아직 화요일입니다.'),
  (2, '곧 개강입니다.');
SELECT * FROM post;

SELECT *
FROM board_user
INNER JOIN post p
ON board_user.id = p.board_user_id;

SELECT *
FROM board_user
LEFT JOIN post p
ON board_user.id = p.board_user_id;

INSERT INTO post (board_user_id, content) VALUES
  (10, '안녕하세요 반갑습니다. 10번입니다.'),
  (15, '저는 15번 유저입니다.');

SELECT *
FROM board_user
RIGHT JOIN post p
ON board_user.id = p.board_user_id;

-- MySQL 에서는 FULL OUTER JOIN 지원 안함
-- UNION 집합연산을 사용해서 FULL OUTER JOIN 구현 가능

-- NATURAL JOIN
-- 동일한 목적의 테이블인데, 컬럼 구성이 다소 다른 테이블
CREATE TABLE private_info1 (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20),
    age INT
    -- 등등~~
);
CREATE TABLE private_info2 (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20),
    address VARCHAR(50)
);
INSERT INTO private_info1 (name, age) VALUES
  ('user1', 10),
  ('user2', 11),
  ('user3', 12),
  ('user4', 15),
  ('user5', 20),
  ('user6', 21),
  ('user7', 30),
  ('user8', 35),
  ('user9', 50),
  ('user10', 99);
INSERT INTO private_info2 (name, address) VALUES
  ('user1', 'my home'),
  ('user2', 'my office'),
  ('user3', 'my hotel'),
  ('user4', 'my apt'),
  ('user5', 'my yard'),
  ('user6', 'my sky'),
  ('user7', 'my seoul'),
  ('user8', 'my background'),
  ('user9', 'my playground'),
  ('user10', 'nowhere');

-- 매우 암묵적으로 연결되는 JOIN 방식
SELECT * FROM private_info1
NATURAL JOIN private_info2;

CREATE TABLE private_info3 (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20),
    insurance_registered BOOLEAN
);
INSERT INTO private_info3 (name, insurance_registered) VALUES
  ('user1', TRUE),
  ('user10', FALSE),
  ('user2', TRUE),
  ('user3', TRUE),
  ('user4', TRUE),
  ('user5', TRUE),
  ('user6', FALSE),
  ('user7', FALSE),
  ('user8', FALSE),
  ('user9', FALSE);

SELECT *
FROM private_info1 AS p1
INNER JOIN private_info3 AS p3
USING (name);

CREATE TABLE device (
    device_name VARCHAR(20),
    disk_size INT
);
CREATE TABLE color_option (
    color_name VARCHAR(10)
);
INSERT INTO device VALUES
  ('Galaxy S24', 1024),
  ('Galaxy S24', 512),
  ('Galaxy S24', 256),
  ('iPhone 15', 1024),
  ('iPhone 15', 512),
  ('iPhone 15', 256);
INSERT INTO color_option VALUES
  ('black'),
  ('blue'),
  ('white');

SELECT *
FROM  device
CROSS JOIN color_option;

DROP TABLE staff;
CREATE TABLE staff (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(20),
  job VARCHAR(20),
  salary INT,
  supervisor_id INT  -- SELF JOIN 키
);
SELECT * FROM staff;
INSERT INTO staff (name, job, salary, supervisor_id) VALUES
  ('staff1', '백엔드', 8500, null),
  ('staff2', '인프라', 7500, null),
  ('staff3', '보안', 7000, 1),
  ('staff4', '프론트', 7200, 1),
  ('staff5', '데이터분석가', 8500, 2),
  ('staff6', '데이터엔지니어', 8000, 2),
  ('staff7', '데브옵스', 7800, 2),
  ('staff8', '유지보수', 6800, 10),
  ('staff9', 'QA', 6500, 10),
  ('staff10', 'PM', 7000, null);

SELECT s1.id, s1.name, s1.supervisor_id, s2.name
FROM staff s1 INNER JOIN staff s2
ON s1.supervisor_id = s2.id;

SELECT normal_staff.id, normal_staff.name, normal_staff.supervisor_id, supervisor_staff.name supervisor_name
FROM staff normal_staff LEFT JOIN staff supervisor_staff
ON normal_staff.supervisor_id = supervisor_staff.id;

# SELECT s1.id, s1.name, s1.supervisor_id, s2.name supervisor_name
# FROM staff s1 RIGHT JOIN staff s2
# ON s1.supervisor_id = s2.id;