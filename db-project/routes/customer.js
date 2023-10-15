const express = require('express');
const router = express.Router();

const {getOrder, getProducts} = require('../controllers/customer');


router.get('/orders',getOrder);
router.get('/products', getProducts);
router.get('/test', (req,res)=>{res.json("test")});



module.exports = router;