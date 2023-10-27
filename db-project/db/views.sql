CREATE OR REPLACE VIEW usedhours AS (select `truck_schedule`.`truck_id`,(`route`.`trip_time`) as used_hours FROM `truck_schedule`,`route` where `truck_schedule`.`store_id`=`route`.`store_id` and `truck_schedule`.`route_id`=`route`.`route_id` group by `truck_schedule`.`truck_id` order by `truck_schedule`.`truck_id`);
   
