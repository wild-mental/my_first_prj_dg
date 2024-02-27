CREATE TABLE cat (
    name VARCHAR(20),
    age INT,
    owner VARCHAR(20),
    type VARCHAR(20)
);
CREATE TABLE dog (
    name VARCHAR(20),
    age INT,
    owner VARCHAR(20),
    type VARCHAR(20)
);
CREATE TABLE animal (
    name VARCHAR(20),
    age INT,
    owner VARCHAR(20),
    type VARCHAR(20)
);
INSERT INTO cat VALUES
    ('도리', 3,'SU', 'black cat'),
    ('코코로', 4,'SU rear gate', 'ramen store cat');
INSERT INTO dog VALUES
    ('DOG1', 1, 'no master', 'jindo'),
    ('DOG2', 2, 'recently born', 'shiba');
SELECT * FROM cat
UNION
SELECT * FROM dog;

INSERT INTO animal VALUES
    ('DOG1', 1, 'no master', 'jindo'),
    ('DOG2', 2, 'recently born', 'shiba'),
    ('도리', 3,'SU', 'black cat'),
    ('코코로', 4,'SU rear gate', 'ramen store cat');

SELECT * FROM cat
UNION
SELECT * FROM dog
UNION ALL
SELECT * FROM animal;

-- FULL OUTER JOIN
SELECT *
FROM board_user
LEFT JOIN post p
ON board_user.id = p.board_user_id
UNION
SELECT *
FROM board_user
RIGHT JOIN post p
ON board_user.id = p.board_user_id;