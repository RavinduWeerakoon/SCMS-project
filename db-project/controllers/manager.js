
let {pool , call_db ,connection}= require('../db/connection');


async function getSales(req,res){
   

    const year = Number(req.query.year) || 2023;
    
    const query = "call getQuarterlySales(?)"

    const result = await call_db(query, [year]);

    return res.status(200).json(result[0]);
}

async function getProductSales(req,res){
    
    const query = "call getProductSales()"

    const result = await call_db(query, null);

    return res.status(200).json(result[0]);
}


async function getOrderDestinations(req,res){
        
        const query = "call orderDestinations()"
    
        const result = await call_db(query, null);
    
        return res.status(200).json(result[0]);
}


async function getDriverHours(req,res){
    const query = "select * from driver_hours order by ID";
    var results = await call_db(query, null);

    results = results.map(result => {
        const start_date = new Date(result.start_date);
        const end_date = new Date(result.end_date);
        const updated_start = start_date.toISOString().split('T')[0];
        const updated_end = end_date.toISOString().split('T')[0];
        return { ...result,start_date:updated_start,end_date:updated_end}})

    return res.status(200).json(results);
}

async function getAssistantHours(req,res){
    const query = "select * from assistant_hours order by ID";
    var results = await call_db(query, null);

    results = results.map(result => {
        const start_date = new Date(result.start_date);
        const end_date = new Date(result.end_date);
        const updated_start = start_date.toISOString().split('T')[0];
        const updated_end = end_date.toISOString().split('T')[0];
        return { ...result,start_date:updated_start,end_date:updated_end}})

    return res.status(200).json(results);
}

async function getTruckInfo(req,res){
    const query = "call truckTimes()"

    const result = await call_db(query, null);
    return res.status(200).json(result[0]);
}

async function getUserOrders(req,res){
    const query = "call userOrders()";

    const result = await call_db(query, null);
    return res.status(200).json(result[0]);
}

module.exports = {getSales, getProductSales, getOrderDestinations, getDriverHours, getAssistantHours, getTruckInfo,getUserOrders}

