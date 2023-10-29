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