import React, { useEffect, useState } from 'react';
import { BarChart, Bar, XAxis, YAxis, CartesianGrid, Tooltip, Legend, ResponsiveContainer } from 'recharts';

interface ProductSale {
  ID: number;
  name: string;
  count: number;
}



const renderLegend = (props:any) => {
    const { payload } = props;
  
    return (
      <ul>
        {
          payload.map((entry:ProductSale, index:number) => (
            <li key={`item-${index}`}>{entry.ID}-{entry.name}</li>
          ))
        }
      </ul>
    );
  }

const ProductSales: React.FC = () => {
  const [sales, setSales] = useState<ProductSale[]>([]);

  useEffect(() => {
    const fetchData = async () => {
      try {
        const response = await fetch('http://localhost:5000/admin/product-sales');
        
        const data: ProductSale[] = await response.json();
        
       
        setSales(data);
      } catch (error) {
        console.error('There was an error!', error);
      }
    };

    fetchData();
  }, []);


  return (                            
    <BarChart width={1000} height={500} data={sales} className='mx-auto'>
      <CartesianGrid strokeDasharray="3 3" />
      <XAxis dataKey="ID" />
      <YAxis />
      <Tooltip />
      <Legend content={renderLegend} />
      <Bar dataKey="count" fill="#8884d8" />
      
    </BarChart>
    )
};

export default ProductSales;