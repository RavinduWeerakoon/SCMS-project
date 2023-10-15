
-- //this will use to create the train order record after creating the order

CREATE DEFINER = CURRENT_USER TRIGGER `testdb`.`orders_AFTER_INSERT` AFTER INSERT ON `orders` FOR EACH ROW
BEGIN
    INSERT INTO `train_order`(`order`,`remained_qty`,`status`) VALUES (NEW.ID,NEW.qty, NEW.qty ,0);
END


END