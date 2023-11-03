let {pool , call_db ,connection}= require('../db/connection');
const {decodeToken} = require('../middleware/authMiddleware')

const trainManager = require('../models/trainManager')




async function getIncompletedOrders(req, res) {
    try {
        // const orderId = req.params.orderId;
        var orders = await trainManager.getIncompletedOrders(req);
        
   

        orders = orders[0].map(order => {
            const date = new Date(order.date_ordered);
            const updatedDate = date.toISOString().split('T')[0];
            return { ...order, date_ordered: updatedDate }});

        
        

        res.status(200).json(orders);
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: 'Internal server error' });
    }
}


async function getTrainSchedule(req, res){

    try{
    let train_schedule = await trainManager.getTrainSchedule(req);

    train_schedule = train_schedule.map(t_schedule => {
        const date = new Date(t_schedule.date);
        const updatedDate = date.toISOString().split('T')[0];
        return { ...t_schedule, date: updatedDate }})
    res.status(200).json(train_schedule);
    } catch (error){
        console.error(error);
        res.status(500).json({ message: 'Internal server error' });
    }
}

async function addTrainSchedule(req, res){
    try{
        const train_schedule = await trainManager.addTrainSchedule(req);
        
        res.status(200).json(train_schedule);
    } catch(error){
        console.error(error);
        res.status(500).json({ message: 'Internal server error' });
    }
}

async function sendOrder(req, res){

    try{
        
        
        const result = await trainManager.sendOrder(req);
        console.log("Sucess");
        res.status(200).json(result);
    } catch(error){
        console.error(error);
        res.status(500).json({ message: 'Internal server error' });
    }
}

async function getProduct(req, res){
    try{
        const product = await trainManager.getProduct(req);
        res.status(200).json(product);
    } catch(error){
        console.error(error);
        res.status(500).json({ message: 'Internal server error' });
    }

}

async function getTrains(req,res){
    try{
        const trains = await trainManager.getTrains(req);
        res.status(200).json(trains);
    } catch(error){
        console.error(error);
        res.status(500).json({ message: 'Internal server error' });
    }
}


async function getDestinations(req,res){

    const query = `select city_name from city_warehouse`;
    const result = await call_db(query, null);
    res.status(200).json(result);

}

async function confirmOrder(req,res){
    const id = req.body.bulk_id;

    const query = `update train_bulk set confirmed = 1 where id = ?`;

    const result = await call_db(query, [id]);
}


module.exports = { getIncompletedOrders, getTrainSchedule, addTrainSchedule, sendOrder, getProduct, getTrains, getDestinations, confirmOrder};