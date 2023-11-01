const Customer = require('../models/customer/customer');

const {pool, call_db} = require('../db/connection');

async function getOrder(req, res) {
    try {
        // const orderId = req.params.orderId;
        const order = await Customer.getOrders(req);
        console.log(order)
        res.status(200).json(order);
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: 'Internal server error' });
    }
}


async function getProducts(req, res) {
    try {
        const products = await Customer.getProducts(req);
        res.status(200).json(products);
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: 'Internal server error' });
    }
}

async function getPaths(req, res) {
    try {
        const query = `SELECT ID,warehouse,destinations FROM path`;
        const paths = await call_db(query, null);
        
        res.status(200).json(paths);
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: 'Internal server error' });
    }
}


async function createOrder(req, res){
    try{
        const order = await Customer.createOrder(req);
        res.status(200).json(order);
    } catch(error){
        console.error(error);
        res.status(500).json({ message: 'Internal server error' });
    }
}

module.exports = { getOrder, getProducts, getPaths, createOrder };
