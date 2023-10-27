INSERT INTO `product` (
        `name`,
        `type`,
        `description`,
        `unit_capacity`,
        `unit_price`
    )
VALUES (
        'single rule CR 80pages',
        'stationary',
        'available book types are single rule, double rule, square rule: no of pages 40,80,120,160:CR and exercise:promate and atlas',
        15,
        115.00
    ),
    (
        'double rule CR 80pages',
        'stationary',
        'available book types are single rule, double rule, square rule: no of pages 40,80,120,160:CR and exercise:promate and atlas',
        15,
        115.00
    ),
    (
        'square rule CR 80pages',
        'stationary',
        'available book types are single rule, double rule, square rule: no of pages 40,80,120,160:CR and exercise:promate and atlas',
        15,
        115.00
    ),
    (
        'I phone 14 pro Cell Phone Cover',
        'Electronics',
        'Only black color covers are available. ',
        5,
        500.00
    ),
    (
        'Galaxy s13  Phone Cover',
        'Electronics',
        'Only black color covers are available. ',
        5,
        550.00
    ),
    (
        'iPhone 12 Pro Max Phone Cover',
        'Electronics',
        'Only Black color covers are available.',
        6,
        1000.00
    ),
    (
        'rechargeable torch',
        'Electronics',
        'Charger is available',
        30,
        3000.00
    ),
    (
        'Hair dryer ',
        'Electroinc',
        'Can be used for any type of hair.',
        10,
        1000.00
    ),
    (
        'Badminton Racket',
        'Sports',
        'Made in Japan',
        15,
        '2000.00'
    ),
    (
        'Badminton Racket Vft P5',
        'Sports',
        'A fine badminton racket product.',
        15,
        '1500.00'
    ),
    (
        'Tennis Racket',
        'Sports',
        'Made in China',
        13,
        2000.00
    ),
    (
        'TONE Clip Plier',
        'stationary',
        'for Removing Resin Clip of Automobiles.',
        15,
        700.00
    ),
    (
        'Stapler Tacker',
        'stationary',
        'Brand is Heavy Duty',
        18,
        500.00
    );
INSERT INTO `user` (`email`, `password`, `type`)
VALUES ('a@gmail.com', 'assistant', 'assistant'),
    (
        'assistant10@gmail.com',
        'assistant',
        'assistant'
    ),
    ('assistant2@gmail.com', 'assistant', 'assistant'),
    (
        'assistant30@gmail.com',
        'assistant',
        'assistant'
    ),
    (
        'assistant39@gmail.com',
        'assistant',
        'assistant'
    ),
    ('assistant6@gmail.com', 'assistant', 'assistant'),
    ('assistant7@gmail.com', 'assistant', 'assistant'),
    ('customer10@gmail.com', 'customer', 'customer'),
    ('customer11@gmail.com', 'customer', 'customer'),
    ('customer12@hotmail.com', 'customer', 'customer'),
    ('customer13@gmail.com', 'customer', 'customer'),
    ('customer14@gmail.com', 'customer', 'customer'),
    ('customer15@gmail.com', 'customer', 'customer'),
    ('customer16@gmail.com', 'customer', 'customer'),
    ('customer17@gmail.com', 'customer', 'customer'),
    ('customer18@gmail.com', 'customer', 'customer'),
    ('customer19@gmail.com', 'customer', 'customer'),
    ('customer1@gmail.com', 'customer', 'customer'),
    ('customer20@gmail.com', 'customer', 'customer'),
    ('customer21@gmail.com', 'customer', 'customer'),
    ('customer22@gmail.com', 'customer', 'customer'),
    ('customer23@gmail.com', 'customer', 'customer'),
    ('customer24@gmail.com', 'customer', 'customer'),
    ('customer25@gmail.com', 'customer', 'customer'),
    ('customer26@gmail.com', 'customer', 'customer'),
    ('customer27@gmail.com', 'customer', 'customer'),
    ('customer28@gmail.com', 'customer', 'customer'),
    ('customer2@gmail.com', 'customer', 'customer'),
    ('customer3@gmail.com', 'customer', 'customer'),
    ('customer4@gmail.com', 'customer', 'customer'),
    ('customer5@gmail.com', 'customer', 'customer'),
    ('customer6@gmail.com', 'customer', 'customer'),
    ('customer7@gmail.com', 'customer', 'customer'),
    ('customer8@gmail.com', 'customer', 'customer'),
    ('customer9@gmail.com', 'customer', 'customer'),
    ('d@gmail.com', 'driver', 'driver'),
    ('driver2@gmail.com', 'driver', 'driver'),
    ('driver3@gmail.com', 'driver', 'driver'),
    ('driver4@gmail.com', 'driver', 'driver'),
    ('driver5@gmail.com', 'driver', 'driver'),
    ('driver6@gmail.com', 'driver', 'driver'),
    ('driver7@gmail.com', 'driver', 'driver'),
    ('driver8@gmail.com', 'driver', 'driver'),
    ('driver9@gmail.com', 'driver', 'driver'),
    ('m@gmail.com', 't_manager', 'Manager'),
    ('s20@gmail.com', 't_manager', 'T_Manager'),
    ('s2@gmail.com', 's_manager', 'S_Manager'),
    ('s3@gmail.com', 's_manager', 'S_Manager'),
    ('s40@hotmail.com', 's_manager', 'S_Manager'),
    ('s4@gmail.com', 's_manager', 'S_Manager'),
    ('s@gmail.com', 's_manager', 'S_Manager');

INSERT INTO `customer` (`user_ID`, `customer_type`)
VALUES (27, 'end customer'),
    (28, 'wholesaler'),
    (29, 'retailer'),
    (30, 'wholesaler'),
    (31, 'end customer'),
    (32, 'end customer'),
    (33, 'wholesaler'),
    (34, 'retailer'),
    (35, 'end customer'),
    (36, 'end customer'),
    (37, 'end customer'),
    (38, 'wholesaler'),
    (39, 'end customer'),
    (40, 'end customer'),
    (41, 'end customer'),
    (42, 'end customer'),
    (43, 'end customer'),
    (44, 'end customer'),
    (45, 'wholesaler'),
    (46, 'end customer'),
    (47, 'end customer'),
    (48, 'end customer'),
    (49, 'end customer'),
    (50, 'end customer'),
    (51, 'end customer'),
    (52, 'end customer'),
    (53, 'end customer');

INSERT INTO `manager` (
        `profile`,
        `type`,
    )
VALUES (63, 'admin_manager');


INSERT INTO `manager` (
        `profile`,
        `type`,
    )
VALUES (64, 'train_manager');




INSERT INTO `store` (`city_name`, `manager`, `address`) VALUES
('Galle',65, 'no 90,Galle'),
('Matara', 66,'No3,Matara Main Road,Matara'),
('Colombo', 67,'No 2, Colombo 7'),
(' Negombo',68, 'no 5, Negambo'),
('Jaffna', 69, 'No 10, Jaffna');



INSERT INTO `driver` (`user_id`, `warehouse`) VALUES
(54, 'Colombo'),
(55, 'Colombo'),
(56, 'Colombo');


INSERT INTO `route` (`warehouse`, `destinations`, `description`, `time_taken`) VALUES

('Colombo','Colombo-Kaluthara', 'Addresses of kaluthara also will be covered in this route', '04:00:00'),
('Colombo','Colombo-Panadura', 'Addresses of Panadura city will also be covered in this route', '02:30:00'),
('Negambo', 'Negambo-Meegamuwa', 'Addresses of Meegamuwa will also be covered in this route', '01:30:00'),
('Negambo','Negambo-Gampaha', 'Addresses of Gampaha will also be covered in this route', '04:00:00'),
('Jaffna','Jaffna-Polonnaruwa', 'Addresses of Polonnaruwa will also be  covered in this route', '05:00:00'),
('Anuradhapura','Trinco-Anuradapura', 'Addresses of Anuradapura will also be covered in this route', '05:00:00')
('Galle','galle-baddegama', 'All the addresses in this route should be covered', '02:00:00'),
('Galle','galle-imaduwa', 'All the addresses within this route can be covered.', '04:00:00'),
('Galle','galle-akuressa', 'All the addresses within this route can be covered.', '03:00:00'),
('Galle','galle-ahangama', 'All the addresses in this route should be covered', '00:30:00'),
('Galle','galle-balapitiya', 'All the addresses in this route should be covered', '01:00:00'),
('Galle','galle-yakkalamulla', 'All the addresses in this route should be covered', '01:00:00'),
('Matara','Matara-Weligama', 'Addresses within this route are covered', '00:30:00'),
('Matara','Matara-Hambanthota', 'Since Transportation via railway is not happened to Hambanthota, addresses of Hambanthota will also be covered in this route.', '05:00:00'),
('Colomco', 'Colombo-Gampaha', 'Addresses of Gampaha will be covered using this route', '02:30:00');


INSERT INTO `truck` (`registration_id`, `warehouse`) VALUES
('10001', 'Colombo'),
('10002', 'Colombo'),
('10003', 'Colombo'),
('20001', 'Jaffna'),
('20002', 'Jaffna'),
('30001', 'Colombo'),
('30002', 'Anuradhapura'),
('40001', 'Colombo'),
('50001', 'Galle'),
('60001', 'Galle');


INSERT INTO `train` (`ID`,`name`, `initial_capacity`, `destinations`) VALUES
(2,'Colombo Commuter', 300, 'Colombo,Galle,Mathara, Negambo'),
(3,'Connected Train - Matara', 500, 'Colombo,Galle,Mathara'),
(4,'Intercity - Colombo', 250, 'Colombo, Kandy, Badulla'),
(5,'Podi Menike - Badulla', 400, 'Colombo, Kandy, Badulla'),
(6,'Udarata Manike - Badulla', 420, 'Colombo, Kandy, Badulla'),
(7,'Udarata Manike - Colombo', 250, 'Colombo, Kandy, Badulla');


INSERT INTO `order`  (`customer`, `product_id`, `state`,`date_ordered`,`path`, `delivery_address`, `qty`, `price`) VALUES
(27, 10,'finished', '2020-12-16',31 'No 3,Elliot road,Colombo',30, 6000),
(27, 11,'finished', '2020-12-17', 43,'No 10,Main Street,Galle',150, 8000),
(52, 10, 'finished', '2020-12-17', 41,'No 20,Light Hoouse road,Matara',20, 56000),
(34, 12, 'finished', '2020-12-17',42, 'No 1,Main road, Hambanthota',300, 45000),
(33, 10, 'finished', '2020-12-17',35, 'No 10,Elliot road,Galle',30, 60000),
(33, 11, 'finished', '2020-12-18', 31,'No 4,Colombo 7', '575.00', 75, 30000),
(29, 11, 'finished', '2020-12-18',43, 'No 10,Main Road, Gampaha',50, 90000),
(30, 14, 'finished', '2020-12-18',34, 'No 11, 3rd step, Anuradapura',30, 78000),
(29, 8, 'finished', '2020-12-18',34, 'No 10,Temple road, Polonnaruwa',10, 35000),
(30, 7, 'finished', '2020-12-18', 33,'No 10,Elliot road, Jaffna',10, 20000),
(31, 12, 'finished', '2020-12-18',37, 'No 1,Sea road, Negambo',10, 12000),
(35, 9, 'finished', '2020-12-18', 38,'No 1,Elliot road,Galle',150, 55000),
(36, 9, 'finished', '2021-02-20',39, 'No 3,Elliot road,Galle', 25, 65000),
(34, 8, 'finished', '2021-02-20',38, 'No 10,Main road,Galle',150, 44000),
(50, 6, 'finished', '2021-02-20',31, 'No 10,Main Road, Gampaha', 900, 90000),
(50, 6, 'finished', '2021-02-20',43, 'No 4,Colombo 7',200, 15000),
(48, 1, 'finished', '2021-02-20',42, 'No 20,Light Hoouse road,Matara', 28, 88000),
(47, 2, 'finished', '2021-02-20',34, 'No 11, 3rd step, Anuradapura', 105, 64000),
(49, 1, 'finished', '2021-02-20',42, 'No 1,Main road, Hambanthota',200, 23000),
(50, 10, 'finished', '2021-02-20',37, 'No 10,Elliot road,Galle',150, 55000),
(42, 3, 'truck', '2021-02-20',34, 'No 10,Temple road, Polonnaruwa',5, 24500),
(42, 3, 'truck', '2021-02-20',33, 'No 10,Elliot road, Jaffna',35, 63000),
(41, 11, 'truck', '2021-02-20',31, 'No 1,Sea road, Negambo',75, 62000),
(39, 10, 'truck', '2021-02-20',39, 'No10,Elliot road,Galle',100, 54000),
(38, 4, 'train', '2021-02-20',38, 'No 1,Fort road, Negambo', 15, 23000),
(38, 2, 'train', '2021-02-20',31, 'No 15,Main road, Gampaha',80, 56000.50),
(37, 3, 'train', '2021-02-20',33, 'No 12,Kovil road, Jaffna',11, 49000),
(35, 1, 'train', '2021-02-20',34, 'No 6,Main road, Trinco',36, 24000),
(34, 13, 'unsent', '2021-02-20',34 'No 1, 2ndd step, Anuradapura',30, 44000),
(50, 13, 'unsent', '2021-02-20',33, 'No 3,Main road, Trinco',26, 24500),
(51, 15, 'unsent', '2021-02-20',41, 'No 9,Main road, Hambanthota',450, 35000),
(52, 9, 'unsent', '2021-02-20',43, 'No 12,Garden Road, Gampaha',10, 42500),
(52, 8, 'warehouse', '2021-02-20',31, 'No 7,Colombo 7', '550.00', 5, 20000),
(33, 11, 'warehouse', '2021-02-20',43, 'No 4, Main Road, Kaluthara',100,21300),
(36, 15, 'warehouse', '2021-02-20', 42,'No 2,Light House road, Matara', 500,44000),
(37, 11, 'warehouse', '2021-02-20',31, 'No 7, Main Road, Kaluthara',20,20000),
(37, 8 'unsent', '2021-02-20',43, 'No 2,Garden Road, Gampaha',50,22000),
(38, 15, 'unsent', '2021-02-20',36, 'No 23,Light House road, Matara',40,34300),
(38, 7, 'unsent', '2021-02-20',38, 'No 17, Fort road, Galle',35, 43000),
(40, 7, 'unsent', '2021-02-20',39, 'No 21,Fort road, Negambo',45, 22000);


INSERT INTO `driver_assistant` (`profile`, `warehouse`) VALUES 
('21', 'Colombo'),
('22', 'Colombo'),
('23', 'Galle'),
('24', 'Anuradhapura'),
('25', 'Galle');

INSERT INTO `testdb`.`assistant_roster` (`user_id`, `start_date`, `num_visits`, `num_hours`) VALUES 
('21', '2023-10-23', '1', '20'),
('25', '2023-10-23', '0', '30'),
('22', '2023-10-23', '0', '25'),
('23', '2023-10-16', '0', '35'),
('21', '2023-10-16', '0', '40'),
('25', '2023-10-16', '0', '39');


INSERT INTO `truck_schedule` (`date`, `start_time`, `truck_id`, `assistant`, `driver`, `path`, `order`) VALUES
('2023-12-20 13:16:08', '13:00:00',),
('2023-12-20 13:25:42', '13:17:00',),
('2023-12-20 14:20:16', '13:20:00', ),
('2023-12-20 13:23:39', '13:20:00',),
('2023-12-20 13:25:30', '13:25:00',),
('2023-12-20 13:26:45', '12:25:00',),
('2023-12-20 13:32:13', '11:00:00',),
('2021-02-20 16:52:51', '09:00:00',),
('2024-02-20 16:56:40', '08:00:00',),
('2024-02-20 16:59:02', '08:00:00',),
('2024-02-20 17:07:33', '15:00:00',),
('2024-02-20 17:08:45', '08:00:00',),
('2024-02-20 17:10:57', '08:00:00',),
('2024-02-20 17:12:17', '07:00:00',);



