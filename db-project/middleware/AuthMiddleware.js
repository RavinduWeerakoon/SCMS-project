const jwt = require('jsonwebtoken');
// import jwt from 'jsonwebtoken';

function decodeToken(req){
     // get the token from cookie
    const token = req.cookies.jwt;

    // token exist then deocde it
    if(token){
        const decodedToken = jwt.verify(token,'secret',(err,decodedToken) => {
            if(err){
                return null
            }
            // return decoded token
            return decodedToken
        })
        return decodedToken
        
    }
    else{
        return null
    }
}

function authUser(req, res, next){
    const decodeToken = decodeToken(req);

    if(decodeToken){
        console.log(decodeToken);
    }
}

// auth customer
function requireAuthCustomer(req,res,next){

    // get the token from cookie
    const decodedtoken = decodeToken(req);

    if(decodedtoken){
        console.log(decodedtoken)
        
        if(decodedtoken.type === 'customer'){
            console.log(decodedtoken)
            next();
        }
        else{
            res.redirect('/')
        }
    }else{
        res.redirect('/')
    }
}
//auth driver

function requireAuthManager(req,res,next){
    const decodedtoken = decodeToken(req);

    // get the token from cookie
    const token = req.cookies.jwt;
 if(decodedtoken){
        console.log(decodedtoken)
        
        if(decodedtoken.type === 'Manager'){
            console.log(decodedtoken)

    
            next();
        }
        else{

            res.redirect('/')
        }
    }
    else{
        res.redirect('/')
    }
}



// auth assistant
function requireAuthStoreManager(req,res,next){

    // get the token from cookie
    const decodedtoken = decodeToken(req);

    if(decodedtoken){
        console.log(decodedtoken)
        
        if(decodedtoken.type === 'S_Manager'){
            console.log(decodedtoken)
            next();
        }
        else{
            res.redirect('/')
        }
    }else{
        res.redirect('/')
    }
}

// auth assistant
function requireAuthDriver(req,res,next){

    // get the token from cookie
    const decodedtoken = decodeToken(req);

    if(decodedtoken){
        console.log(decodedtoken)
        
        if(decodedtoken.type === 'driver'){
            console.log(decodedtoken)
            next();
        }
        else{
            res.redirect('/')
        }
    }else{
        res.redirect('/')
    }
}

// auth manager
function requireAuthManager(req,res,next){

    // get the token from cookie
    const decodedtoken = decodeToken(req);

    if(decodedtoken){
        console.log(decodedtoken)
        
        if(decodedtoken.type === 'Manager'){
            console.log(decodedtoken)
            next();
        }
        else{
            res.redirect('/')
        }
    }else{
        res.redirect('/')
    }
}

// auth assistant
function requireAuthAssistant(req,res,next){


    // get the token from cookie
    const decodedtoken = decodeToken(req);

    if(decodedtoken){
        console.log(decodedtoken)
        
        if(decodedtoken.type === 'assistant'){
            console.log(decodedtoken)
            next();
        }
        else{
            res.redirect('/')
        }
    }else{
        res.redirect('/')
    }
}

module.exports = {requireAuthCustomer,requireAuthManager,requireAuthStoreManager,requireAuthDriver,requireAuthAssistant,decodeToken};