
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

module.exports.signup_post = async (req,res) => {
    
    const {
        email,
        name,
        type,
        password,
        contact_no,
        customer_type,
    } = req.body;


            
            
            const result = await AuthCustomer.registerCustomer(
                {
                    email:email,
                    name:name,
                    type:type,
                    password:await bcrypt.hash(password, 10),//hashing the password
                    contact_no:contact_no,
                    customer_type:customer_type
                })

            res.status(200).json({"success":"true"})
            
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

module.exports.login_post = async (req,res) => {
    const {
        email,
        password
    } = req.body;
    
    console.log(req.body);
    LogInUser.getUserInfo(pool,res,req,{email})
    .then(data => {

       
        console.log(data);
        AuthServices.checkPassword(data[0].password,password)
        .then(async matched => {

            console.log('hash compare done -' + matched)

            if(matched){

                //should have to update just create the dummy token
                const user = data[0];
                const token = AuthServices.createToken(user)

                if (user.type == "s_manager"){
                   const warehouse = await  LogInUser.getWareHouse(user.ID)
                   user.warehouse =  warehouse[0].city_name
                }

                
                res.cookie('jwt', token , { httpOnly : true,maxAge:AuthServices.expire * 1000});

                const {password, ...userWithoutPassword} = user;


                console.log(user);

                
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
    res.status(200).json({
                        message:'logout success',
                        error:false,
                        redirect:"/"
                })
}

module.exports.test_request = (req,res) =>{
    console.log(req.body)
    res.status(200).json({message:'success'})
}