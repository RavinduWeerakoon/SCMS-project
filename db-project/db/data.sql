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


INSERT INTO `order`  (`customer`, `product`, `date_and_time_of_placement`, `delivery_address`, `price`, `capacity`) VALUES
(27, 10, 'finished', '2020-12-16 20:54:04', 'No 3,Elliot road,Galle', '3000.00', 30),
(7, 10, 'Assigned to truck', '2020-12-17 06:54:04', 'No 10,Main road,Galle', '1150.00', 150),
(3, 10, 107, 'Assigned to truck', '2020-12-17 07:54:00', 'No 20,Light Hoouse road,Matara', '1200.00', 20),
(4, 12, 108, 'Assigned to truck', '2020-12-17 08:50:04', 'No 1,Main road, Hambanthota', '30000.00', 300),
(5, 13, 10, 'Assigned to truck', '2020-12-17 20:50:04', 'No 10,Elliot road,Galle', '3000.00', 30),
(6, 8, 109, 'Assigned to truck', '2020-12-18 06:50:04', 'No 4,Colombo 7', '575.00', 75),
(7, 9, 109, 'Assigned to truck', '2020-12-18 07:50:04', 'No 10,Main Road, Gampaha', '5000.00', 50),
(8, 11, 115, 'Assigned to truck', '2020-12-18 08:50:04', 'No 11, 3rd step, Anuradapura', '3000.00', 30),
(9, 14, 114, 'Assigned to truck', '2020-12-18 09:50:04', 'No 10,Temple road, Polonnaruwa', '1000.00', 10),
(10, 15, 114, 'Assigned to truck', '2020-12-18 10:50:04', 'No 10,Elliot road, Jaffna', '1000.00', 10),
(11, 16, 112, 'Assigned to truck', '2020-12-18 13:50:04', 'No 1,Sea road, Negambo', '1000.00', 10),
(12, 17, 10, 'Assigned to truck', '2020-12-18 15:50:04', 'No 1,Elliot road,Galle', '1150.00', 150),
(13, 6, 10, 'Assigned to truck', '2021-02-20 13:45:49', 'No 3,Elliot road,Galle', '1500.00', 25),
(14, 7, 10, 'Assigned to truck', '2021-02-20 13:47:29', 'No 10,Main road,Galle', '1150.00', 150),
(17, 9, 109, 'Assigned to truck', '2021-02-20 13:56:39', 'No 10,Main Road, Gampaha', '7200.00', 50),
(18, 8, 110, 'Assigned to truck', '2021-02-20 14:02:07', 'No 4,Colombo 7', '1150.00', 150),
(19, 10, 108, 'Assigned to truck', '2021-02-20 14:03:19', 'No 20,Light Hoouse road,Matara', '1500.00', 28),
(20, 11, 115, 'Assigned to truck', '2021-02-20 14:05:02', 'No 11, 3rd step, Anuradapura', '4600.00', 105),
(21, 12, 108, 'Assigned to truck', '2021-02-20 14:06:09', 'No 1,Main road, Hambanthota', '10000.00', 200),
(22, 13, 10, 'Assigned to truck', '2021-02-20 14:07:58', 'No 10,Elliot road,Galle', '15000.00', 150),
(23, 14, 114, 'Assigned to truck', '2021-02-20 14:10:00', 'No 10,Temple road, Polonnaruwa', '800.00', 5),
(24, 15, 114, 'Assigned to truck', '2021-02-20 15:55:12', 'No 10,Elliot road, Jaffna', '2050.00', 35),
(25, 16, 113, 'Assigned to truck', '2021-02-20 15:56:11', 'No 1,Sea road, Negambo', '3200.00', 75),
(26, 17, 10, 'Assigned to truck', '2021-02-20 15:58:20', 'No10,Elliot road,Galle', '10000.00', 100),
(27, 18, 113, 'Assigned to truck', '2021-02-20 16:02:13', 'No 1,Fort road, Negambo', '2000.00', 15),
(28, 19, 113, 'Assigned to truck', '2021-02-20 16:03:52', 'No 15,Main road, Gampaha', '4000.00', 80),
(29, 20, 114, 'Assigned to truck', '2021-02-20 16:06:29', 'No 12,Kovil road, Jaffna', '1300.00', 11),
(30, 21, 115, 'Assigned to truck', '2021-02-20 16:08:00', 'No 6,Main road, Trinco', '1000.00', 36),
(31, 22, 115, 'Assigned to truck', '2021-02-20 16:09:28', 'No 1, 2ndd step, Anuradapura', '3000.00', 30),
(32, 23, 115, 'Assigned to truck', '2021-02-20 16:10:51', 'No 3,Main road, Trinco', '4000.00', 26),
(33, 24, 108, 'Assigned to truck', '2021-02-20 16:12:58', 'No 9,Main road, Hambanthota', '3450.00', 450),
(34, 25, 109, 'Assigned to truck', '2021-02-20 16:14:20', 'No 12,Garden Road, Gampaha', '1000.00', 10),
(35, 26, 110, 'Assigned to truck', '2021-02-20 16:15:56', 'No 7,Colombo 7', '550.00', 5),
(36, 27, 110, 'Assigned to truck', '2021-02-20 16:17:24', 'No 4, Main Road, Kaluthara', '2200.00', 30),
(37, 28, 108, 'Assigned to truck', '2021-02-20 16:18:38', 'No 2,Light House road, Matara', '1300.00', 11),
(38, 29, 110, 'Assigned to truck', '2021-02-20 16:19:59', 'No 7, Main Road, Kaluthara', '4000.00', 30),
(39, 30, 109, 'Assigned to truck', '2021-02-20 16:21:31', 'No 2,Garden Road, Gampaha', '1600.00', 10),
(40, 31, 108, 'Assigned to truck', '2021-02-20 16:23:20', 'No 23,Light House road, Matara', '1500.00', 30),
(41, 33, 10, 'Assigned to truck', '2021-02-20 16:24:53', 'No 17, Fort road, Galle', '3000.00', 35),
(42, 32, 113, 'Assigned to truck', '2021-02-20 21:06:16', 'No 21,Fort road, Negambo', '345.00', 45);


