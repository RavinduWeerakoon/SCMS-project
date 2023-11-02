import React, { useEffect, useState } from 'react';

interface OrderDestination {
  warehouse: string;
  destinations: string;
  path: string;
  price: string;
}

const OrderDestinations: React.FC = () => {
  const [data, setData] = useState<OrderDestination[]>([]);

  useEffect(() => {
    const fetchData = async () => {
      try {
        const response = await fetch('http://localhost:5000/admin/order-destinations');
        const data: OrderDestination[] = await response.json();
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
          <th>Warehouse</th>
          <th>Destinations</th>
          <th>Path</th>
          <th>Price</th>
        </tr>
      </thead>
      <tbody>
        {data.map((item, index) => (
          <tr key={index}>
            <td>{item.warehouse}</td>
            <td>{item.destinations}</td>
            <td>{item.path}</td>
            <td>{item.price}</td>
          </tr>
        ))}
      </tbody>
    </table>
  );
};

export default OrderDestinations;