
let {pool , call_db ,connection}= require('../db/connection');
const {decodeToken} = require('../middleware/authMiddleware')



module.exports = class TrainManager{
    
    static async getIncompletedOrders(req){
        // get the orders which does not have a train assigned the state is not delivered
        const query = `call trainOrders()`;
       
        const result = await call_db(query, null);

        // const result={"Abc":"asda"};
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
        const {trainId, date, time} = req.body;
        const query = `call createSchedule(?,?,?)`;
        console.log(time);
        const values = [trainId,date,time];

        const result = await call_db(query, values);

        return result;

    }

    static async sendOrder(req){
        const {order_id,train_schedule_id, quantity,destination,train} = req.body;
        const query = `select send_train_bulk(?,?,?,?,?)`;
        const values = [order_id, quantity,destination,train,train_schedule_id];

        const result = await call_db(query, values);

        return result;
    }


    static async getProduct(req){
        const {order_id} = req.query;
        // ID,name,type,description,unit_capacity,price

      

        const query = `select p.ID, p.name, p.type, p.description,p.unit_capacity,p.unit_price 
                       from orders o join product p 
                       on o.product_id=p.ID 
                       where o.ID=?`;
        const values = [order_id];

        const result = await call_db(query, values);
        return result;

    }

    static async getTrains(req){
        const query = `select id,name from train`;

        const result = await call_db(query, null);

        return result;
    }




    

    
}