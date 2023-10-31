import { useEffect, useState } from "react";
import { json } from "react-router-dom";
import { Pie, PieChart, ResponsiveContainer, Tooltip } from "recharts";

import PieChartBox from "../pieChartBox/PieChartBox";



interface IncomeData {
  income_year: string;
  income_quarter: string;
  quarterly_income: number;
}

interface data{
  name:string,
  value:number,
  color:string
}

const QuarterlySales = () => {
  const [incomeData, setIncomeData] = useState<IncomeData[]>([]);
  const [Data, setData] = useState<data[]>([]);



  useEffect(() => {
    const fetchData = async () => {
      const response = await fetch("http://localhost:5000/admin/quarter-sales");
      
      const data = await response.json();

      
      const data1 = data.map((item:IncomeData) => {
         return {
          name:item.income_quarter,
          value:item.quarterly_income,
          color:"#123456"
         }
      })

      // console.log(JSON.stringify(data1));

      const data3 = [
        {name:"1", value:400, color:"#121234"},
        {name:"2", value:400, color:"#121245"},
        {name:"3", value:500, color:"#121345"},
        {name:"4", value:600, color:"#561345"},
      ]

    

      setData(data3);
    };
    fetchData();
  }, []);

  return (

    <PieChartBox data={Data}/>


  );
};

export default QuarterlySales;