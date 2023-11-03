const express = require('express');
const router = express.Router();

const {getIncompletedOrders, getTrainSchedule, sendOrder, getProduct, getTrains, addTrainSchedule, getDestinations, confirmOrder} = require('../controllers/trainManager');


router.get('/test', (req,res) => {
    res.json("test")
});

router.get('/get-incompleted', getIncompletedOrders);
router.get('/get-schedule', getTrainSchedule);
router.post('/send-order', sendOrder);
router.get('/get-details', getProduct);
router.get('/get-trains', getTrains)
router.get('/get-destinations', getDestinations);
router.post('/add-schedule', addTrainSchedule);

router.post('/confirm-order', confirmOrder);


module.exports = router;