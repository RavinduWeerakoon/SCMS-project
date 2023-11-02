const express = require('express');
const router = express.Router();


const {getSales, getProductSales, getOrderDestinations, getAssistantHours, getDriverHours, getTruckInfo, getUserOrders} = require("../controllers/manager.js")


router.get("/test", (req,res)=>{res.status(200).json('json')});
router.get("/quarter-sales", getSales);
router.get("/product-sales", getProductSales);
router.get("/order-destinations", getOrderDestinations);

router.get("/driver-hours", getDriverHours);
router.get("/assistant-hours", getAssistantHours);

router.get("/truck-info", getTruckInfo);
router.get("/user-orders", getUserOrders);




module.exports = router;