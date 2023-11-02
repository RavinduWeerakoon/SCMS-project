import React, { useEffect, useState } from 'react';
import { BarChart, Bar, XAxis, YAxis, CartesianGrid, Tooltip, Legend, ResponsiveContainer } from 'recharts';

interface IncomeData {
  income_year: number;
  income_quarter: number;
  quarterly_income: string;
}

const QuarterlySales: React.FC = () => {
  const [data, setData] = useState<IncomeData[]>([]);

  useEffect(() => {
    const fetchData = async () => {
      try {
        const response = await fetch('http://localhost:5000/admin/quarter-sales');
        const data = await response.json();
        setData(data);
      } catch (error) {
        console.error('There was an error!', error);
      }
    };

    fetchData();
  }, []);

  
  
  return (                            
  <BarChart width={600} height={500} data={data} className='max-auto'>
    <CartesianGrid strokeDasharray="3 3" />
    <XAxis dataKey="income_quarter" />
    <YAxis />
    <Tooltip />
    <Legend />
    <Bar dataKey="quarterly_income" fill="#8884d8" />
    
  </BarChart>
  )
};

export default QuarterlySales;