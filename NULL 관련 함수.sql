CREATE TABLE customer2 (
    customer_id   int PRIMARY KEY,
    customer_name varchar(20)
);
CREATE TABLE drink_order2 (
   id int PRIMARY KEY,
   customer_id int REFERENCES Customers(customer_id) ON DELETE NO ACTION,
   ordered_at date,
   total_amount decimal(10,2)
);

INSERT INTO drink_order2 (id, customer_id, ordered_at, total_amount) VALUES
(1, 101, '2024-02-26', 35000),
(2, 102, NULL, 9500),
(3, NULL, '2024-02-25', 21000);
SELECT * FROM drink_order2;

SELECT id, IFNULL(customer_id, 'Unknown') AS customer_id, IFNULL(ordered_at, 'Not specified') AS ordered_at, total_amount
FROM drink_order2;

SELECT id, customer_id, NULLIF(ordered_at, '2024-02-26') AS ordered_at, total_amount
FROM drink_order2;

SELECT id, COALESCE(customer_id, col2, col3, col4, 'N/A') AS customer_id, COALESCE(ordered_at, 'N/A') AS ordered_at, total_amount
FROM drink_order2;