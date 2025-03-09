USE mydb;
-- Создание хранимой процедуры для получения заказов клиента с управлением потоком данных
DELIMITER $$

CREATE PROCEDURE GetCustomerOrders(IN customerID INT)
BEGIN
    DECLARE total_orders INT;
    DECLARE message VARCHAR(255);
    DECLARE done INT DEFAULT FALSE;
    DECLARE order_id INT;
    DECLARE order_quantity INT;
    DECLARE order_date DATE;
    DECLARE product_name VARCHAR(255);
    DECLARE product_price DECIMAL(10,2);

    -- Объявление курсора (ДОЛЖНО быть перед HANDLER)
    DECLARE order_cursor CURSOR FOR 
        SELECT o.order_ID, o.order_quantity, o.order_date, p.p_name, p.p_price 
        FROM orders o
        JOIN products p ON o.order_product_ID = p.product_ID
        WHERE o.order_customer_ID = customerID;
    
    -- Обработчик ошибок
    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN
        ROLLBACK;
        SELECT 'Ошибка при выполнении процедуры' AS ErrorMessage;
    END;
    
    -- Обработчик конца данных курсора
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    -- Подсчет количества заказов клиента
    SELECT COUNT(*) INTO total_orders FROM orders WHERE order_customer_ID = customerID;
    
    -- Управление потоком данных с IF
    IF total_orders = 0 THEN
        SET message = 'У клиента нет заказов';
    ELSEIF total_orders < 5 THEN
        SET message = 'У клиента мало заказов';
    ELSE
        SET message = 'У клиента много заказов';
    END IF;
    
    -- Вывод сообщения
    SELECT message AS OrderStatus;
    
    -- Открытие курсора
    OPEN order_cursor;
    
    read_loop: LOOP
        FETCH order_cursor INTO order_id, order_quantity, order_date, product_name, product_price;
        IF done THEN
            LEAVE read_loop;
        END IF;
        
        -- Вывод каждой строки
        SELECT order_id, order_quantity, order_date, product_name, product_price;
    END LOOP;
    
    -- Закрытие курсора
    CLOSE order_cursor;
END $$

DELIMITER ;

