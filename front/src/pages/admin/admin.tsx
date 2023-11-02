
import QuarterlySales from "../charts/quarterlySales";

import ProductSales from "../charts/productSales";

import OrderDestinations from "../charts/orderDestinations";
import AssistantHoursTable from "../charts/assistantHours";
import DriverHoursTable from "../charts/driverHours";
import TruckInfo from "../charts/truckInfo";

import UserOrders from "../charts/userOrders";





const Admin = () => {
    
    return (
        <div className="admin">

            <QuarterlySales/>
            <ProductSales/>
            <OrderDestinations/>
            
            <AssistantHoursTable/>
            <DriverHoursTable/>
            <TruckInfo/>
            <UserOrders/>
            
        </div>
    );
}


export default Admin;