const express = require('express');
const router = express.Router();


const {getSales, getProductSales, getOrderDestinations} = require("../controllers/manager.js")


router.get("/test", (req,res)=>{res.status(200).json('json')});
router.get("/quarter-sales", getSales);
router.get("/product-sales", getProductSales);
router.get("/order-destinations", getOrderDestinations);




module.exports = router;