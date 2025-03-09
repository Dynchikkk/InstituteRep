USE mydb;

-- Использование переменных и временных таблиц

-- Объявление переменных
SET @max_price = (SELECT MAX(p_price) FROM products);
SET @min_price = (SELECT MIN(p_price) FROM products);
SET @customer_count = (SELECT COUNT(*) FROM customers);

-- Вывод значений переменных
SELECT @max_price AS MaxPrice, @min_price AS MinPrice, @customer_count AS CustomerCount;

-- Создание временной таблицы с дорогими продуктами
CREATE TEMPORARY TABLE ExpensiveProducts AS
SELECT * FROM products WHERE p_price > @max_price * 0.8;

-- Выборка из временной таблицы
SELECT * FROM ExpensiveProducts;

-- Создание временной таблицы с заказами за последний месяц
CREATE TEMPORARY TABLE RecentOrders AS
SELECT * FROM orders WHERE order_date >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH);

-- Выборка из временной таблицы
SELECT * FROM RecentOrders;

-- Использование переменной в условии
SET @target_price = 60000;
SELECT * FROM products WHERE p_price > @target_price;

-- Удаление временных таблиц
DROP TEMPORARY TABLE IF EXISTS ExpensiveProducts;
DROP TEMPORARY TABLE IF EXISTS RecentOrders;

-- Удаление хранимых процедур, если они уже существуют
DROP PROCEDURE IF EXISTS GetCustomerOrders;
DROP PROCEDURE IF EXISTS CalculateTotalSpent;

DELIMITER $$

-- Создание хранимой процедуры для получения заказов клиента с управлением потоком данных
CREATE PROCEDURE GetCustomerOrders(IN customerID INT)
BEGIN
    -- Объявление переменных
    DECLARE total_orders INT;
    DECLARE message VARCHAR(255);
    DECLARE done INT DEFAULT FALSE;
    DECLARE order_id INT;
    DECLARE order_quantity INT;
    DECLARE order_date DATE;
    DECLARE product_name VARCHAR(255);
    DECLARE product_price DECIMAL(10,2);

    -- Объявление курсора (должно идти до объявлений обработчиков)
    DECLARE order_cursor CURSOR FOR 
        SELECT o.order_ID, o.order_quantity, o.order_date, p.p_name, p.p_price 
        FROM orders o
        JOIN products p ON o.order_product_ID = p.product_ID
        WHERE o.order_customer_ID = customerID;

    -- Объявление обработчиков
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN
        ROLLBACK;
        SELECT 'Ошибка при выполнении процедуры' AS ErrorMessage;
    END;

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

-- Создание второй хранимой процедуры для расчета общей суммы заказов клиента
CREATE PROCEDURE CalculateTotalSpent(IN customerID INT, OUT totalSpent DECIMAL(10,2))
BEGIN
    DECLARE total DECIMAL(10,2);
    
    -- Подсчет общей суммы заказов клиента
    SELECT SUM(o.order_quantity * p.p_price) INTO total
    FROM orders o
    JOIN products p ON o.order_product_ID = p.product_ID
    WHERE o.order_customer_ID = customerID;
    
    -- Если заказов нет, установить 0
    IF total IS NULL THEN
        SET total = 0;
    END IF;
    
    -- Присвоение значения выходной переменной
    SET totalSpent = total;
END $$

DELIMITER ;

-- Вызов хранимых процедур
CALL GetCustomerOrders(1);
SET @totalSpent = 0;
CALL CalculateTotalSpent(1, @totalSpent);
SELECT @totalSpent AS TotalSpentByCustomer;
