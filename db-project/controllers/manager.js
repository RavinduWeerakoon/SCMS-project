
let {pool , call_db ,connection}= require('../db/connection');


async function getSales(req,res){
    
    const query = "call getQuarterlySales(?)"

    const result = await call_db(query, [2023]);

    return res.status(200).json(result[0]);
}

async function getProductSales(req,res){
    
    const query = "call getProductSales()"

    const result = await call_db(query, null);

    return res.status(200).json(result[0]);
}


async function getOrderDestinations(req,res){
        
        const query = "call getOrderDestinations()"
    
        const result = await call_db(query, null);
    
        return res.status(200).json(result[0]);
}

module.exports = {getSales, getProductSales, getOrderDestinations}

