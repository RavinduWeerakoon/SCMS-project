const {call_db} = require('../../db/connection');

let CustomerInstance = null;

class CustomerAuth{
    static getInstance(){
        if(CustomerInstance === null){
            CustomerInstance = new CustomerAuth();
        }
        return CustomerInstance;
    }

        /**
     * 
     * @param {mysql.pool} pool - connection pool to database
     * @param {response} res - response to the after signed up
     * @param {request} req - request that containg customer details
     * @param {cusDetails} req - details of the customer including hashed password
     * 
     */

        async registerCustomer(cusDetails){

        
          

                let { name,contact_no,password,email,type,customer_type} = cusDetails;

 
                
                // Use the connection
                const q = "INSERT INTO `user` (`email`, `password`, `phone`, `type`, `name`) VALUES (?,?,?,?,?)"
                console.log([email, password, contact_no,customer_type,name]);

                const result = await call_db(q, [email, password, contact_no,"customer",name]);

                return result;
    
                
          
        }
    
}


module.exports = CustomerAuth;
