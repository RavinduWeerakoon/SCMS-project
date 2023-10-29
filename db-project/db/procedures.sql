CREATE PROCEDURE `getDriverWorkingHours` (
 driver_id int)
BEGIN

	select * from driver_roster d
    where d.user_id = driver_id;

END

CREATE PROCEDURE `createSchedule` (
	trainID int,
    scDate date,
    scTime time
)
BEGIN

    DECLARE trainCapacity DECIMAL;
    
    -- Retrieve the train capacity from the train table via the train ID
    SELECT capacity INTO trainCapacity FROM train WHERE id = trainID;
    
    -- Insert a new record into the train_schedule table with the provided values
    INSERT INTO train_schedule (date, available_capacity, train_id, time)
    VALUES (scDate, trainCapacity, trainID, scTime);


END



CREATE PROCEDURE getDriver(IN city VARCHAR(50))
BEGIN
    -- Select the driver with the least amount of num_hours and num_visits less than 1 in the given city
    
    SELECT dr.user_id FROM 
    driver_roster dr join driver d 
    on (d.user_id = dr.user_id)
    WHERE d.warehouse = city  AND dr.previous_visit = false AND dr.end_date > current_date() 
    ORDER BY num_hours ASC;

END

CREATE PROCEDURE getAssistant(IN city VARCHAR(50))
BEGIN
    -- Select the assistant with the least amount of num_hours and num_visits less than 1 in the given city
    
    SELECT asst.user_id FROM 
    assistant_roster asst join driver_assistant a 
    on (a.profile = asst.user_id)
    WHERE a.warehouse = city  AND asst.num_visits <2 AND asst.end_date > current_date() 
    ORDER BY num_hours ASC;

END



CREATE PROCEDURE addTruckSchedule(
  IN truck_id INT,
  IN assistant INT,
  IN driver INT,
  IN start_time TIME,
  IN date DATE,
  IN order_id INT,
  IN bulk_id INT
)
BEGIN
  -- Add the truck schedule to the truck_schedule table
  INSERT INTO truck_schedule (truck_id, assistant, driver, start_time, date, order_id, bulk_id)
  VALUES (truck_id, assistant, driver, start_time, date, order_id, bulk_id);

  -- Update the previous_visit field of the driver with the previous visit as true and the end date greater than today
  UPDATE driver_roster
  SET previous_visit = false
  WHERE user_id = (
    SELECT user_id
    FROM driver_roster
    WHERE previous_visit = true AND end_date > CURRENT_DATE()
    LIMIT 1
  );

  -- Update the previous_visit field of the assigned driver to true
  UPDATE driver_roster
  SET previous_visit = true
  WHERE user_id = driver;
END



CREATE PROCEDURE `updateDriver`(
	driver int,
    city varchar(50))
BEGIN

	

	declare u_id int;
    
	SELECT dr.user_id
	INTO u_id
	FROM driver_roster dr join driver d  on (dr.user_id = d.user_id)
	WHERE dr.previous_visit = true AND dr.end_date > CURRENT_DATE() and d.warehouse = city
	LIMIT 1;
    
    update driver_roster
	SET previous_visit = false
	WHERE user_id = u_id;
    
    update driver_roster
	SET previous_visit = true
	WHERE user_id = driver AND end_date > current_date();
END


CREATE PROCEDURE `updateAssistant`(
  assistant int,
  city varchar(50))

BEGIN

  declare u_id int;

  update assistant_roster
  set asst.num_visits = 0
  FROM assistant_roster asst join driver_assistant a  on (asst.user_id = a.profile)
  WHERE asst.num_visits > 0 AND asst.end_date > CURRENT_DATE() and a.warehouse = city and asst.user_id != assistant


  UPDATE assistant_roster
  set num_visits = num_visits + 1
  WHERE user_id = assistant AND end_date > current_date();

END


END


CREATE DEFINER=`root`@`localhost` PROCEDURE `createTruckSchedule`(
  truck_id varchar(50),
  assistant INT,
  driver INT,
  start_time TIME,
  date DATE,
  order_id INT,
  bulk_id INT,
  city varchar(50)
  )
BEGIN

  call updateDriver(driver, city);
  call updateAssistant(assistant, city);
    
  INSERT INTO truck_schedule (truck_id, assistant, driver, start_time, date, order_id, bulk_id)
  VALUES (truck_id, assistant, driver, start_time, date, order_id, bulk_id);


END