const express = require('express');
const router = express.Router();

const {getIncompletedOrders, getTrainSchedule, sendOrder, getProduct} = require('../controllers/trainManager');


router.get('/test', (req,res) => {
    res.json("test")
});

router.get('/get-incompleted', getIncompletedOrders);
router.get('/get-schedule', getTrainSchedule);
router.post('/send-order', sendOrder);
router.get('/get-details', getProduct);


module.exports = router;