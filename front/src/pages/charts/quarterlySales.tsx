import React, { useEffect, useState } from 'react';
import { BarChart, Bar, XAxis, YAxis, CartesianGrid, Tooltip, Legend, ResponsiveContainer } from 'recharts';

interface IncomeData {
  income_year: number;
  income_quarter: number;
  quarterly_income: string;
}

const QuarterlySales: React.FC = () => {
  const [data, setData] = useState<IncomeData[]>([]);
  const [year, setYear] = useState((new Date()).getFullYear());

  useEffect(() => {
    const fetchData = async () => {
      try {
        const response = await fetch(`http://localhost:5000/admin/quarter-sales?year=${year}`);
        const data = await response.json();
        setData(data);
      } catch (error) {
        console.error('There was an error!', error);
      }
    };

    fetchData();
  }, [year]);

  const handleYearChange = (event: React.ChangeEvent<HTMLSelectElement>) => {
    
    setYear(Number(event.target.value));
  
  };
  
  
  return ( 
  <div>
    <select value={year} onChange={handleYearChange}>
    <option value="2023">2023</option>
    <option value="2020">2020</option>
    <option value="2021">2021</option>
    <option value="2022">2022</option>
    // Add more options as needed
  </select>                           
  <BarChart width={600} height={500} data={data} className='max-auto'>
    <CartesianGrid strokeDasharray="3 3" />
    <XAxis dataKey="income_quarter" />
    <YAxis />
    <Tooltip />
    <Legend />
    <Bar dataKey="quarterly_income" fill="#8884d8" />
    
  </BarChart>
  </div>
  )
};

export default QuarterlySales;