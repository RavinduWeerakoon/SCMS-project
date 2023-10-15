const express = require('express');
const router = express.Router();

const customerRouter = require('./customer.js');
const trainManagerRouter = require('./trainManager.js');
const authRouter = require('./api.js');    

router.use('/customer', customerRouter);
router.use('/trainmanager', trainManagerRouter);
router.use('/auth', authRouter);

module.exports = router;