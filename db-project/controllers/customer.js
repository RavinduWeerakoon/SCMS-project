const Customer = require('../models/customer/customer');

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

module.exports = { getOrder, getProducts };
