const express = require('express');
const router = express.Router();

const {getOrder, getProducts, getPaths, createOrder} = require('../controllers/customer');


router.get('/orders',getOrder);
router.get('/products', getProducts);
router.get('/getPaths', getPaths)
router.get('/test', (req,res)=>{res.json("test")});

router.post('/createOrder',createOrder);

module.exports = router;