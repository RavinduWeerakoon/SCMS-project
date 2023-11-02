import { ReactNode } from 'react';
import {
    QueryClient,
    QueryClientProvider,
  } from "@tanstack/react-query";

  import Navbar from '../navbar/Navbar';
import { Outlet } from 'react-router-dom';
import Footer from '../footer/Footer';
  

interface LayoutProps {
  menuComponent: ReactNode;
}

const Layout: React.FC<LayoutProps> = ({ menuComponent }) => {

const queryClient = new QueryClient(); 
  return (
    <div className="main">
      <Navbar />
      <div className="container-fluid" style={{width:'100%'}}>
        <div className="menuContainer shadow bg-light">
          {menuComponent}
        </div>
        <div className="contentContainer">
          <div className="shadow bg-light">
          <QueryClientProvider client={queryClient}>
            <Outlet />
          </QueryClientProvider>
          </div>
          
      
        </div>
      </div>
      <Footer />
    </div>
  );
};

export default Layout;