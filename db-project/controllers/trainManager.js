let {pool , call_db ,connection}= require('../db/connection');
const {decodeToken} = require('../middleware/authMiddleware')

const {trainManager} = require('../models/trainManager')




async function getIncompletedOrders(req, res) {
    try {
        // const orderId = req.params.orderId;
        const order = await trainManager.getIncompletedOrders(req);
        console.log(order)
        res.status(200).json(order);
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: 'Internal server error' });
    }
}


async function getTrainSchedule(req, res){

    try{
    const train_schedule = await trainManager.getTrainSchedule(req);
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




module.exports = { getIncompletedOrders, getTrainSchedule };