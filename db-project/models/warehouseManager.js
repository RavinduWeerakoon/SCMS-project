
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

    static async sendBulk(city){
        const query = `call sendBulk(?)`;
        const values = [city];

        const result = await call_db(query, values);

        return result;
    }

}
