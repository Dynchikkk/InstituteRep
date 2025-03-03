USE mydb;

-- Вложенные запросы

-- Получение заказов, содержащих товары с ценой выше средней
SELECT * FROM orders
WHERE order_product_ID IN (SELECT product_ID FROM products WHERE p_price > (SELECT AVG(p_price) FROM products));

-- Получение клиентов, которые сделали заказы
SELECT * FROM customers WHERE customer_ID IN (SELECT order_customer_ID FROM orders);

-- Получение заказов, сделанных в последние 30 дней
SELECT * FROM orders WHERE order_date >= (SELECT DATE_SUB(CURDATE(), INTERVAL 30 DAY));

-- Получение самой дорогой доставки
SELECT * FROM delivery_types WHERE dt_price = (SELECT MAX(dt_price) FROM delivery_types);

-- Получение заказов, в которых количество товаров больше среднего
SELECT * FROM orders WHERE order_quantity > (SELECT AVG(order_quantity) FROM orders);