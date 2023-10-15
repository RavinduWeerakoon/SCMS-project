let {pool , call_db ,connection}= require('../../db/connection');
const {decodeToken} = require('../../middleware/authMiddleware')


module.exports = class Customer{

static createOrder(request) {
    
    
        // get the token from request
        const decodedToken = decodeToken(request)


        console.log(decodedToken);
        
        // extract the email
        const email = decodedToken.ID;
        const query = ```insert into order(customer, product_id, date_ordered, path, qty. state, price)
        values (?, ?, ?, ?, ?, ?);```
    

  
}
static getRoutes() {
    return new Promise((resolve, reject) => {
        pool.query("CALL getRoutes()",
            (error, results, fields) => {
                if (error) {
                    reject(error);
                };
                resolve(results);
            }
        )
    })
  
}

static async getOrders(req){

    const token = decodeToken(req);
    const userID = token.ID

    const query = `select * from orders where ID=?`;
    
    const result = await call_db(query, [userID]);
    
    return result;

}





static async getProducts(req){
    
        const query = `select * from product`;
        
        const result = await call_db(query);
        
        return result;
    
}


}