const express = require('express');
const router = express.Router();

const {signup_get,login_post, signup_post, test_request, logout_get} = require('../controllers/auth.js');

router.get('/test', (req,res) => {
    res.json("test");
});

router.get('/signup', signup_get);
router.post('/signup',signup_post);
router.post('/test_post',test_request);
router.post('/login', login_post);

router.get('/login', (req, res)=>{res.status(200).json("login called")})
router.get('/logout', logout_get)



module.exports = router;