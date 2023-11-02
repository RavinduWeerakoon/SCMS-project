import React, { useEffect, useState } from 'react';

interface TruckInfoData {
  truck_id: string;
  time: string;
}

const TruckInfo: React.FC = () => {
  const [data, setData] = useState<TruckInfoData[]>([]);

  useEffect(() => {
    const fetchData = async () => {
      try {
        const response = await fetch('http://localhost:5000/admin/truck-info');
        const data: TruckInfoData[] = await response.json();
        setData(data);
      } catch (error) {
        console.error('There was an error!', error);
      }
    };

    fetchData();
  }, []);

  return (
    <table className="table table-striped table-bordered table-hover">
      <thead>
        <tr>
          <th>Truck ID</th>
          <th>Time</th>
        </tr>
      </thead>
      <tbody>
        {data.map((item, index) => (
          <tr key={index}>
            <td>{item.truck_id}</td>
            <td>{item.time}</td>
          </tr>
        ))}
      </tbody>
    </table>
  );
};

export default TruckInfo;