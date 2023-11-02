import React, { useEffect, useState } from 'react';

interface AssistantHours {
  ID: number;
  name: string | null;
  start_date: string;
  end_date: string;
  num_hours: string;
}

const AssistantHoursTable: React.FC = () => {
  const [data, setData] = useState<AssistantHours[]>([]);

  useEffect(() => {
    const fetchData = async () => {
      try {
        const response = await fetch('http://localhost:5000/admin/assistant-hours');
        const data: AssistantHours[] = await response.json();
        setData(data);
      } catch (error) {
        console.error('There was an error!', error);
      }
    };

    fetchData();
  }, []);

  return (
    <div>
        <h3>Assistant Hours</h3>
    <table className="table table-striped table-bordered table-hover">
      <thead>
        <tr>
          <th>ID</th>
          <th>Name</th>
          <th>Start Date</th>
          <th>End Date</th>
          <th>Number of Hours</th>
        </tr>
      </thead>
      <tbody>
        {data.map((item, index) => (
          <tr key={index}>
            <td>{item.ID}</td>
            <td>{item.name}</td>
            <td>{item.start_date}</td>
            <td>{item.end_date}</td>
            <td>{item.num_hours}</td>
          </tr>
        ))}
      </tbody>
    </table>
    </div>
  );
};

export default AssistantHoursTable;