const express = require('express');
const router = express.Router();

const {getIncompletedOrders, getTrainSchedule} = require('../controllers/trainManager')

router.get('/test', (req,res) => {
    res.json("test")
});

router.get('/get-incompleted', getIncompletedOrders);
router.get('/get-schedule', getTrainSchedule);

module.exports = router;