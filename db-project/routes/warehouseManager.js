const express = require('express');
const router = express.Router();

const {getBulks, getDrivers,getAssistants, getVehicles, sendBulk} = require("../controllers/warehouseManager")


router.get('/test', (req,res) => {res.status(200).json("test")});
router.get('/get-bulks', getBulks);

router.get('/get-drivers', getDrivers)
router.get('/get-assistants', getAssistants)
router.get('/get-vehicles', getVehicles)
router.post('/send-bulk', sendBulk)


module.exports = router;