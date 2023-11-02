import React, { useEffect, useState } from 'react';

interface UserOrder {
  ID: number;
  name: string;
  price: string;
}

const UserOrders: React.FC = () => {
  const [data, setData] = useState<UserOrder[]>([]);

  useEffect(() => {
    const fetchData = async () => {
      try {
        const response = await fetch('http://localhost:5000/admin/user-orders');
        const data: UserOrder[] = await response.json();
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
          <th>ID</th>
          <th>Name</th>
          <th>Price</th>
        </tr>
      </thead>
      <tbody>
        {data.map((item, index) => (
          <tr key={index}>
            <td>{item.ID}</td>
            <td>{item.name}</td>
            <td>{item.price}</td>
          </tr>
        ))}
      </tbody>
    </table>
  );
};

export default UserOrders;