let {pool , call_db ,connection}= require('../db/connection');
const {decodeToken} = require('../middleware/authMiddleware')



module.exports = class TrainManager{
    
    static async getIncompletedOrders(req){
        // get the orders which does not have a train assigned the state is not delivered
        const query = `select * from orders where state != 'delivered'`;

        const result = await call_db(query, null);

        

        return result;
    }

    static async getTrainOrders(req){
        const query = `select * from orders where state='train'`

        const result = await call_db(query, null);

        return result;
    } 


    static async getTrainSchedule(req){
        const query = `select * from train_schedule`

        const result = await call_db(query, null);

        return result;
    }

    static async addTrainSchedule(req){
        const {train_id, date_leaving, time_leaving} = req.body;
        const query = `select create_schedue(?,?,?)`;
        const values = [train_id, date_leaving, time_leaving];

        const result = await call_db(query, values);

        return result;

    }


    

    
}