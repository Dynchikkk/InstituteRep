USE mydb;

-- Многотабличные запросы с объединением

-- INNER JOIN: получение заказов с информацией о клиенте
SELECT o.order_ID, o.order_quantity, o.order_date, c.c_name, c.c_phone 
FROM orders o
INNER JOIN customers c ON o.order_customer_ID = c.customer_ID;

-- LEFT JOIN: получение всех клиентов и их заказов (если есть)
SELECT c.customer_ID, c.c_name, o.order_ID, o.order_date 
FROM customers c
LEFT JOIN orders o ON c.customer_ID = o.order_customer_ID;

-- RIGHT JOIN: получение всех заказов и информации о клиентах (если есть)
SELECT o.order_ID, o.order_date, c.c_name, c.c_phone 
FROM orders o
RIGHT JOIN customers c ON o.order_customer_ID = c.customer_ID;

-- FULL OUTER JOIN (имитация через UNION): объединение клиентов и заказов
SELECT c.customer_ID, c.c_name, o.order_ID, o.order_date 
FROM customers c
LEFT JOIN orders o ON c.customer_ID = o.order_customer_ID
UNION
SELECT c.customer_ID, c.c_name, o.order_ID, o.order_date 
FROM customers c
RIGHT JOIN orders o ON c.customer_ID = o.order_customer_ID;

-- CROSS JOIN: комбинации всех клиентов и всех продуктов
SELECT c.c_name, p.p_name, p.p_price 
FROM customers c
CROSS JOIN products p;
