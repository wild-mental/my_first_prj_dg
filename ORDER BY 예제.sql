SELECT * FROM bank_account;

INSERT INTO bank_account (account_owner, balance)
VALUES
    ('워렌 버핏', 2100000000),
    ('일론 머스크', 2000000000),
    ('빌 게이츠', 1900000000),
    ('재드래곤', 1000000000);

SELECT * FROM bank_account
ORDER BY balance DESC;

SELECT * FROM bank_account
ORDER BY account_owner DESC;

-- ORDER BY 할 때에 염두에 둘 것!
-- WHERE 조건에 적어준 필터링 기준 컬럼이 INDEX 가 설정되어 있는 경우,
-- 자동으로 해당 INDEX 에 따라서 정렬된 결과가 출력됨
SELECT * FROM bank_account
WHERE account_number > 4; -- WHERE 조건에 들어온 인덱스가 사용되면서 자동 정렬됨

SELECT * FROM drink_order2;

SELECT * FROM drink_order2
ORDER BY customer_id IS NULL;
-- NULL 아닌 경우 : 0, NULL 인 경우 TRUE : 1
-- ORDER BY customer_id NULLS LAST;  ANSI 표준이 아님..!

SELECT * FROM drink_order2
ORDER BY 3, 4;

SELECT customer_id, SUM(total_amount)
FROM drink_order2
GROUP BY customer_id
ORDER BY SUM(total_amount) DESC;

SELECT customer_id, SUM(total_amount)
FROM drink_order2
GROUP BY customer_id
ORDER BY SUM(total_amount) DESC;

SELECT *
FROM drink_order2
ORDER BY
    CASE order_status
        WHEN 'completed' THEN total_amount
        -- NULL 값인 경우 CASE 문 처리 확인
    END;
