
let {pool , call_db ,connection}= require('../db/connection');
const {decodeToken} = require('../middleware/authMiddleware')

module.exports = class warehouseManager{

    static async getBulks(city){
        const query = `call getBulks(?)`;
        const values = [city];

        const result = await call_db(query, values);

        return result;
    }

    static async getDrivers(city){
        const query = `call getDrivers(?)`;
        const values = [city];

        const result = await call_db(query, values);

        return result;
    }


    static async getAssistants(city){
        const query = `call getAssistants(?)`;
        const values = [city];

        const result = await call_db(query, values);

        return result;
    }

    static async getVehicles(city){
        const query = `call getVehicles(?)`;
        const values = [city];

        const result = await call_db(query, values);

        return result;
    }

// bulk_id: props.bulk.ID,
// order_id: props.bulk.order,
// driver_id: selectedDriver,
// assistant_id: selectedAssistant,
// vehicle_id: selectedTruck,
// schedule_time: scheduleTime,
// schedule_date: scheduleDate
    static async sendBulk(data){
        const query = `call createTruckSchedule(?,?,?,?,?,?,?,?)`;
        const values = [data.vehicle_id,
                        data.assistant_id,
                        data.driver_id,
                        data.schedule_time,
                        data.schedule_date,
                        data.order_id,
                        data.bulk_id,
                        data.city];

        const result = await call_db(query, values);

        return result;
    }

    

}
