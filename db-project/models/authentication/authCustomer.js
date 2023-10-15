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

        async registerCustomer(pool,res,req,...cusDetails){

        
            return new Promise((resolve, reject) => {
                pool.getConnection(function(err, connection) {

                let { name,contact_no,password,email,type,customer_type} = cusDetails[0];

                if (err) {
                    res.status(500).send('Internal Server Error')
                    res.end();
                    throw err;
                } // not connected! 
                
                // Use the connection
                //INSERT INTO `testdb`.`user` (`email`, `password`, `phone`, `type`, `name`) VALUES ('avsud', 'jkasd', 'jasndj', 'lansod', 'kabjsd');
                console.log([email, password, contact_no,customer_type,name]);
                let query = `INSERT INTO user(email, password, phone, type, name) VALUES (?,?,?,?,?)`
                connection.query(query,
                                [email, password, contact_no,"customer",name], 
                                function (error, results, fields) {

                       

                 

                            if(!error){

                            connection.query(`INSERT INTO customer(user_ID, customer_type, workplace_address) VALUES (?, ?, ?)`,
                                             [results.insertId,customer_type,"abc"],
                                             (error, results, fields)=>{
                                                console.log("called")
                                                connection.release()
                                                if(error){
                                                    console.log(error);
                                                    reject(error);
                                                    resolve(results);
                                                }
                                             });

                            }                                             

                            resolve(results);
                        // Don't use the connection here, it has been returned to the pool.
                });

                
            });
        })
    }
}

module.exports = CustomerAuth;
