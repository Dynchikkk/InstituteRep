USE mydb;

-- Создание хранимой процедуры для получения заказов клиента
DELIMITER $$
CREATE PROCEDURE GetCustomerOrders(IN customerID INT)
BEGIN
    SELECT o.order_ID, o.order_quantity, o.order_date, p.p_name, p.p_price 
    FROM orders o
    JOIN products p ON o.order_product_ID = p.product_ID
    WHERE o.order_customer_ID = customerID;
END $$
DELIMITER ;

-- Вызов хранимой процедуры
CALL GetCustomerOrders(1);
