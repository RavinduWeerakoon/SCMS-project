let {pool , call_db ,connection}= require('../../db/connection');
const {decodeToken} = require('../../middleware/authMiddleware')


module.exports = class Customer{

static async createOrder(request) {
    
    
        // get the token from request
        const decodedToken = decodeToken(request)

        const {product_id,date_ordered,path,quantity,price, delivery_address} = request.body;

        const customer = decodedToken?.ID1 || 1;

       
        
        // extract the email
        // const email = decodedToken.ID;
        const query = "insert into orders(customer, product_id, date_ordered, path, qty, state, price) values (?, ?, ?, ?, ?, ?, ?)";

        const result = await call_db(query, [customer, product_id, date_ordered, path, quantity, "unsent", price, delivery_address]);
        return result;
    

  
}
static async getRoutes() {
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