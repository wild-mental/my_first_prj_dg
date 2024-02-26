집계함수 상황예제 :
  1, 2, 3 반 각각 30행씩 있을 때
  '반 기준' 으로 통계처리 AVG, SUM, COUNT
  총 90행이 3행으로 축약되어 나타나는 효과!!!!

SELECT * FROM employee;

SELECT
    department_id,
    COUNT(id) AS employee_count,
    AVG(salary) AS average_salary
FROM
    employee
GROUP BY
    department_id;

SELECT
    job_id,
    department_id,
    COUNT(id) AS employee_count,
    AVG(salary) AS average_salary
FROM
    employee
GROUP BY
    department_id;

SELECT @@sql_mode;
'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION'
SELECT @_sql_mode := @@sql_mode;
SELECT @_sql_mode;
SET sql_mode = '';
SET sql_mode = @_sql_mode;

SELECT
    department_id,
    COUNT(id) AS employee_count,
    AVG(salary) AS average_salary
FROM
    employee
GROUP BY
    department_id
HAVING
    average_salary > 57000;