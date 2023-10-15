
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const {call_db} = require('../db/connection');

const {getCustomer} = require('../models/authentication/login');
let As = null;

class AuthServices {
    'use strict';
    
    static getAuthServicesInstance(){
        return As ? As : new AuthServices()
    }
    
    expire; //token expire time in seconds
    constructor(){
        this.expire = 3 * 24 * 60 * 60;
    }

    //used to get the expire time
    
    get expire(){
        return this.expire;
    }

    /**
     * 
     * @param {String} userType - type of the user
     * @param {Object} data - data returned from database {email,name,...etc}
     * 
     * @returns A object contaning info
     * 
     */
    extractData(userType,data){
        let user = new Object();
        switch (userType) {
                    case 'customer':



                        // get customer information
                        user.email = data[0][0].email;
                        user.customer_id = data[0][0].customer_id;
                        user.customer_name = data[0][0].customer_name;
                        user.customer_type = data[0][0].customer_type;
                        user.contact_number = data[0][0].contact_number;
                        user.type = data[0][0].type;
                        break;
                    
                    case 'Manager':
                    // get Manager information
                        user.email = data[0][0].email;
                        user.manager_id = data[0][0].manager_id;
                        user.manager_name = data[0][0].manager_name;
                        user.contact_number = data[0][0].contact_number;
                        user.type = data[0][0].type;
                    break;

                    case 'S_Manager':
                        // get store Manager information
                        user.email = data[0][0].email;
                        user.store_manager_id = data[0][0].store_manager_id;
                        user.store_manager_name = data[0][0].store_manager_name;
                        user.store_id = data[0][0].store_id;
                        user.contact_number = data[0][0].contact_number;
                        user.type = data[0][0].type;
                    break;

                    case 'driver':
                    // get store Manager information
                        user.email = data[0][0].email;
                        user.driver_id = data[0][0].driver_id;
                        user.driver_name = data[0][0].driver_name;
                        user.store_id = data[0][0].store_id;
                        user.contact_number = data[0][0].contact_number;
                        user.type = data[0][0].type;
                    break;

                    case 'assistant':
                    // get assistant information
                        user.email = data[0][0].email;
                        user.assistant_id = data[0][0].assistant_id;
                        user.assistant_name = data[0][0].assistant_name;
                        user.store_id = data[0][0].store_id;
                        user.contact_number = data[0][0].contact_number;
                        user.type = data[0][0].type;
                    break;
                
                    default:
                        break;
                }
                return user;
}

    /**
     * creating token function
     * @param  {...any} data - data of the user as object
     * @returns A token with encryption with data of the user to be set as a cookie
     */
    createToken(...data){

        console.log(data)
        return jwt.sign(...data, 'secret',{
            
            expiresIn: this.expire
        })
    }

    /**
      *  password compare with hash
      * 
      * @param {string} hash - encrypted string
      * @param {string} password - string to compare with encrypted string
      * @returns A promise to be either resolved with the comparision result salt or rejected with an Error
      */

    async  checkPassword(hash,password) {
    
            return new Promise((resolve, reject) => {
                try {
                    const match = (hash==password); // compare hash
                    resolve(match);
                } catch (error) {
                    reject(error)
                }
            }
            )
    }

    // redirecting function
    redirect(res,userType,isInitialLogin){
        switch (userType) {
                    case 'customer':
                        // redirect to cutomer home page
                        isInitialLogin ? res.redirect("/customer_func/menu/view") : res.status(201).json({
                            message:'login success',
                            error:false,
                            redirect:"/customer_func/menu/view"
                    })
                        
                        break;
                    
                    case 'Manager':
                        // redirect to Manager home page
                        isInitialLogin ? res.redirect("/manager_func/orders/viewOrders") : res.status(201).json({
                            message:'login success',
                            error:false,
                            redirect:"/manager_func/orders/viewOrders"
                    })
                    break;

                    case 'S_Manager':
                        // redirect to Manager home page
                        isInitialLogin ? res.redirect("/storemanager/order/getorders") : res.status(201).json({
                            message:'login success',
                            error:false,
                            redirect:"/storemanager/order/getorders"
                    })
                    break;

                    case 'assistant':
                        // redirect to employee home page
                        isInitialLogin ? res.redirect("/assistant_driver_func/truckschedule/view") : res.status(201).json({
                            message:'login success',
                            error:false,
                            redirect:"/assistant_driver_func/truckschedule/view"
                    })
                    break;

                    case 'driver':
                        // redirect to employee home page
                        isInitialLogin ? res.redirect("/driver_func/truckschedule/view") : res.status(201).json({
                            message:'login success',
                            error:false,
                            redirect:"/driver_func/truckschedule/view"
                    })
                    break;
                
                    default:
                        break;
                }
    }
}
module.exports = AuthServices;