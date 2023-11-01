import Home from "./pages/home/Home";
import { createBrowserRouter, RouterProvider, Outlet } from "react-router-dom";
import Users from "./pages/users/Users";
import Products from "./pages/products/Products";
import BuyProduct from "./pages/buyProduct/buyProduct";
import Navbar from "./components/navbar/Navbar";
import Footer from "./components/footer/Footer";
import Menu from "./components/menu/Menu";
import Login from "./pages/login/Login";
import "./styles/global.scss";
import User from "./pages/user/User";
import Product from "./pages/product/Product";
import TrainSchedule from "./components/schedule/trainSchedule";
import DisplayBulk from "./pages/wareHouseManager/displayBulk";

import ProductList from "./pages/customer/prductList";


import Admin  from "./pages/admin/admin";






import Layout from "./components/layouts/stucture";
import TrainManagerMenu from "./components/Menus/trainManagerMenu";
import WareHouseManagerMenu from "./components/Menus/wareHouseManagerMenu";
import CustomerMenu from "./components/Menus/customerMenu";


function App() {

  const router = createBrowserRouter([

    {path:"/",
    element:<h1>Hi</h1>},
    
    
    {

    path: "/",
      element: <Layout menuComponent={<TrainManagerMenu/>} />,
      children: [
        {
          path: "/",
          element: <Home />,
        },
        {
          path: "/users",
          element: <Users />,
        },
        // {
        //   path: "/products",
        //   element: <Products />,
        // },

        {
          path:"/add-schedule",
          element: <TrainSchedule/>,
        },
        {
          path: "/users/:id",
          element: <User />,
        },
        {
          path: "/products/:id",
          element: <Product />,
        },
        {
          path: "/buy-product/:id",
          element: <BuyProduct/>,
        },
        {
          path:"/display-bulk",
          element: <DisplayBulk/>,
        },
        {
          path: "/admin",
          element: <Admin />,
        }
      ],
    },
    {
      path:"/tmanager",
      element:<Layout menuComponent={<TrainManagerMenu/>}/>,
      children:[
        {
          path:"/tmanager",
          element:<Home/>
        },
        {
          path:"/tmanager/add-schedule",
          element: <TrainSchedule/>,
        },
      ]
    },

    {
      path: "/warehouse",
      element: <Layout menuComponent={<WareHouseManagerMenu/>} />,
      children:[
        {
          path:"/warehouse",
          element:<DisplayBulk/>
        }
      ]

    },

    {
      path:"/customer",
      element:<Layout menuComponent={<CustomerMenu/>} />,
      children:[
        {
          path:"/customer",
          element:<ProductList/>
        }
      ]
    },
    {
      path: "/login",
      element: <Login />,
    },
    {
      path: "*",
      element: <h1>Not Found Try Something New</h1>,
    }

 

  
  ]);

  return <RouterProvider router={router} />;
}

export default App;
