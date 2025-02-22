USE mydb;

-- Заполнение таблицы products
INSERT INTO products (product_ID, p_name, p_price, p_info, p_delivery_available) VALUES
(1, 'Ноутбук', 75000.00, 'Мощный игровой ноутбук', 1),
(2, 'Смартфон', 45000.00, 'Флагманский смартфон с OLED экраном', 1),
(3, 'Пылесос', 12000.00, 'Беспроводной пылесос с высокой мощностью', 1),
(4, 'Часы', 15000.00, 'Умные часы с мониторингом здоровья', 1);

-- Заполнение таблицы customers
INSERT INTO customers (customer_ID, c_name, c_address, c_phone, c_contact_person, customerscol) VALUES
(1, 'ООО "ТехноМир"', 'Москва, ул. Ленина, д. 5', '79991234567', 'Иван Петров', NULL),
(2, 'АО "ГаджетПлюс"', 'Санкт-Петербург, Невский пр., д. 10', '79267894567', 'Мария Смирнова', NULL),
(3, 'ИП Сидоров', 'Екатеринбург, ул. Гагарина, д. 15', '79345671234', 'Алексей Сидоров', NULL);

-- Заполнение таблицы orders
INSERT INTO orders (order_ID, order_customer_ID, order_product_ID, order_quantity, order_date) VALUES
(1, 1, 1, 2, '2025-02-15'),
(2, 2, 2, 3, '2025-02-16'),
(3, 3, 3, 1, '2025-02-17'),
(4, 1, 4, 5, '2025-02-18');

-- Заполнение таблицы delivery_types
INSERT INTO delivery_types (delivery_type_ID, dt_name, dt_price, dt_speed) VALUES
(1, 'Стандартная', 500.00, '3-5 дней'),
(2, 'Экспресс', 1500.00, '1-2 дня'),
(3, 'Самовывоз', 0.00, 'Мгновенно');

-- Заполнение таблицы deliveries
INSERT INTO deliveries (deliveries, delivery_order_ID, delivery_type_ID, delivery_cost) VALUES
(1, 1, 1, 500.00),
(2, 2, 2, 1500.00),
(3, 3, 3, 0.00),
(4, 4, 1, 500.00);

-- Заполнение таблицы product_delivery_types
INSERT INTO product_delivery_types (product_ID, delivery_type_ID) VALUES
(1, 1), (1, 2),
(2, 1), (2, 2), (2, 3),
(3, 1),
(4, 2), (4, 3);
