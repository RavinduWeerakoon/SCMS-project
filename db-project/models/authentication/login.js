
const { call_db } = require('../../db/connection.js');

let loginInstance =null;
const getUser  = async (email) => {
    let query = "SELECT * FROM user WHERE email = ?"
   

    return call_db(query, [email]);

}

const getCustomer  = async (id) => {
    let query = "SELECT * FROM customer WHERE user_ID = ?"
    return call_db(query, [id]);

}



class UserLogin {

    //get the user
    static getInstance() {
        if(loginInstance === null) {
            loginInstance = new UserLogin();
        }
        return loginInstance;
    }

    async getUserInfo(pool,res,req,...cusDetails){
    
        
        const user = await getUser(cusDetails[0].email);

        console.log(user);

        return user;
        
    }

    


}

module.exports = UserLogin;