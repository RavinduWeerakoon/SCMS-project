DELIMITER //
CREATE FUNCTION create_cus(
	email varchar(100),
	contact_number varchar(50),
  password varchar(300),
	customer_name varchar(50),
  customer_type varchar(30)
  )
  RETURNS BOOL
  DETERMINISTIC
  BEGIN
  IF customer_type = 'wholesaler' OR  customer_type = 'retailer' OR customer_type = 'end customer' THEN 
		INSERT INTO `user`(`email`,`password`,`type`, `phone`, `name`) VALUES ( email, password ,"customer", `contact_number`, `name`);
        SELECT LAST_INSERT_ID() AS last_inserted_id;
		INSERT INTO `customer`(`user_ID`,`customer_type`) VALUES (last_inserted_id, customer_type);
		RETURN TRUE;
  END IF;
  RETURN FALSE;
  END
//

CREATE FUNCTION `send_train_bulk` (
  order_id INT ,
  qty DECIMAL(7,2),
  detination varchar(50),
  train INT,
  train_schedule_id INT
)
RETURNS INTEGER
BEGIN

  declare remained_qty DECIMAL(7,2);

  insert into `train_bulck` VALUES (order_id, detination, train, train_schedule_id,qty);
  -- SELECT column_name INTO @myVariable FROM your_table WHERE some_condition;

  SELECT `remained_qty` INTO remained_qty FROM `train_order` WHERE `order_id` = order_id;
  

  if remained_qty = qty THEN
  
    UPDATE `train_order` SET `status` = 'sent' WHERE `order_id` = order_id;
    RETURN 0;

  ELSE remained_qty > qty THEN
    UPDATE `train_order` SET `remained_qty` = remained_qty - qty WHERE `order_id` = order_id;
    RETURN 0;
  ELSE
    RETURN -1;
  END IF;
END

CREATE FUNCTION `create_schedule` (
  train_id INT,
  date_leaving DATE
  time_leaving TIME
)
RETURNS INTEGER
BEGIN
  declare inital_capacity DECIMAL(7,2);

  SELECT `initial_capacity` INTO inital_capacity FROM `train` WHERE `train_id` = train_id;

  INSERT INTO `train_schedule`(`date`, `available_capacity`, `train_id`, `time`) VALUES (date_leaving, inital_capacity, train_id, time_leaving) ;


RETURN 1;
END

CREATE FUNCTION `create_manager` (
  email VARCHAR(255),
  password VARCHAR(255),
  phone VARCHAR(20),
  name VARCHAR(255)
  account_type varchar(50)
)
RETURNS INTEGER
BEGIN
  DECLARE user_id INT;
  
  INSERT INTO `user`(`email`, `type`, `password`, `phone`, `name`) VALUES (email, 'manager', password, phone, name);
  
  SET user_id = LAST_INSERT_ID();
  
  INSERT INTO `manager`(`type`, `profile`) VALUES (user_id, account_type);
  
  RETURN user_id;
END;

















