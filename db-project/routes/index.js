const express = require('express');
const router = express.Router();

const customerRouter = require('./customer.js');
const trainManagerRouter = require('./trainManager.js');
const authRouter = require('./api.js');  
const warehouseManagerRouter =  require('./warehouseManager.js');
const managerRouter = require("./manager.js")

router.use('/customer', customerRouter);
router.use('/trainmanager', trainManagerRouter);
router.use('/auth', authRouter);
router.use('/warehouse', warehouseManagerRouter);
router.use('/admin', managerRouter);

module.exports = router;