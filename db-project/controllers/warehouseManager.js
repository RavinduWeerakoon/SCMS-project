let {pool , call_db ,connection}= require('../db/connection');
const {decodeToken} = require('../middleware/authMiddleware')

const warehouseManager = require('../models/warehouseManager');
// "ID":11,"order":1,"sending_quantity":"3.00","delivery_address":"No 3,Elliot road,Colombo","confirmed":null,"sent":null},
// id: number;
// orderId: number;
// sendingQty: number;
// sendingAddress: string;
// confirmed: boolean;
// sent: boolean;

const getBulks = async (req,res) => {
    const city= "Colombo";
    const result = await warehouseManager.getBulks(city);


    res.status(200).json(result);
}

// getDrivers,getAssisstants, getVehicles, sendBulk

const getDrivers = async (req,res) => {
    const city= "Colombo";
    const result = await warehouseManager.getDrivers(city);

    res.status(200).json(result[0]);

}

const getAssistants = async (req,res) => {
    const city= "Colombo";
    const result = await warehouseManager.getAssistants(city);
    res.status(200).json(result[0]);
}

const getVehicles = async (req,res) => {
    const city= "Colombo";
    const result = await warehouseManager.getVehicles(city);
    res.status(200).json(result[0]);
}

const sendBulk = async (req,res) => {
    const city= "Colombo";
    const result = await warehouseManager.sendBulk(city);
    res.status(200).json(result);
}


module.exports = {getBulks,  getDrivers,getAssistants, getVehicles, sendBulk}
