
// Require the needed dependencies

const pool = require('../db/connection.js');
const bcrypt = require('bcrypt');

const AuthCustomer =  require('../models/authentication/authCustomer.js').getInstance();
const LogInUser = require('../models/authentication/login.js').getInstance();
const AuthServices = require('./auth_utils').getAuthServicesInstance();



module.exports.signup_get = (req,res) => {
    res.render('signup')
}

module.exports.login_get = (req,res) => {

    const token = req.cookies.jwt;
    if(token){
        jwt.verify(token,'secret',(err,decodedToken) => {
            if(err){
                //if anny error occured then redirect to login
                res.redirect('/')
            }else{
                // redirect to login
                AuthServices.redirect(res,decodedToken.type,true);
            }
        })
    }
    res.render('login/index')
}




/****
 * TODO
 *  - need to validate request data - done
 *  - check user exist prior to create new entry in db  - done
 *  - error handling- done
 *  - login function - done
 */

module.exports.signup_post = (req,res) => {
    
    const {
        email,
        name,
        type,
        password,
        contact_no,
        customer_type,
    } = req.body;

    // ************ to-do - validating ********** //

    // hashing the password
    // bcrypt.genSalt(10, (err, salt) => {
    //     if(err){
    //         res.status(500).send('Internal Server Error')
    //     }
    //     bcrypt.hash(password,salt,(err,hash) => {

    //         if(err){
    //             console.error('[error] - hashing password - contoller/authcontroller '+err)
    //             res.status(500).send('Internal Server Error')
    //             return 
    //         }

            // store in database
            console.log(email);
            AuthCustomer.registerCustomer(
                pool,
                res,
                req,
                {
                    email:email,
                    name:name,
                    type:type,
                    password:password,
                    contact_no:contact_no,
                    customer_type:customer_type
                })
            .then(data => {
                // if success redirect to the login page
                res.status(400).json({error:0})
                console.log(data[0])
            })
            .catch(err => {
                // if email already used send bad reqeyuest
                if(err.code === 'ER_DUP_ENTRY')
                    res.status(400).json({error:'this email alredy used'})
                    console.log('[error] - sigining in user [email is laready used] - contoller/authcontroller '+ err);
            })
//         })
//     })
}
/****
 * TODO
 *  - need to validate request data - done
 *  - check if user exist - done
 *  - if user exist then get type of the user - done
 *  - error handling - done
 */

module.exports.login_post = (req,res) => {
    const {
        email,
        password
    } = req.body;
    
    console.log(req.body);
    LogInUser.getUserInfo(pool,res,req,{email})
    .then(data => {

       
        console.log(data);
        AuthServices.checkPassword(data[0].password,password)
        .then(matched => {

            console.log('hash compare done -' + matched)

            if(matched){

                //should have to update just create the dummy token
                const user = data[0];
                const token = AuthServices.createToken(user)

                
                res.cookie('jwt', token , { httpOnly : true,maxAge:AuthServices.expire * 1000});

                const {password, ...userWithoutPassword} = user;


                
                // AuthServices.redirect(res, userType,false)

                res.status(200).json(userWithoutPassword);
            }

        }).catch(err => {

            console.log('[error] - checking password - contoller/authcontroller '+err)
            
            res.status(500).send('Internal Server Error')

        })
    })
    .catch(err => {

        
        if(err.sqlMessage === 'INVALID_LOGIN')
            res.status(400).json({error:'check password or email again'})
            console.log(err);
            console.log('[error] - invalid login attempt - contoller/authcontroller '+err);
    })
}

// logout route
module.exports.logout_get = (req,res) => {
    // delete auth jwt cookie to logout
    res.cookie('jwt','',{ maxAge:99})
    res.status(201).json({
                        message:'logout success',
                        error:false,
                        redirect:"/"
                })
}

module.exports.test_request = (req,res) =>{
    console.log(req.body)
    res.status(200).json({message:'success'})
}