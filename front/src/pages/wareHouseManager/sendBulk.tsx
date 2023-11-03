import { useState, useEffect } from 'react';

interface TrainBulk {
  ID: number;
  order: number;
  sending_quantity: number;
  delivery_address: string;
  confirmed: boolean;
  sent: boolean;
}

interface  bulkProps{
  bulk : TrainBulk
}



interface Driver {
  user_id: number;
  name: string;
}

interface Assistant {
  user_id: number;
  name: string;
}

interface Truck{
  registration_id: string;
}

const SendBulk:React.FC<bulkProps> =  (props) => {
  const [drivers, setDrivers] = useState<Driver[]>([]);
  const [assistants, setAssistants] = useState<Assistant[]>([]);
  const [trucks, setTrucks] = useState<Truck[]>([]); // TODO: fetch trucks from backend


  const [selectedDriver, setSelectedDriver] = useState<number>(0);
  const [selectedAssistant, setSelectedAssistant] = useState<number>(0);
  const [selectedTruck, setSelectedTruck] = useState<string>('');

  const [scheduleTime, setScheduleTime] = useState<string>('');
  const [scheduleDate, setScheduleDate] = useState<string>('');

  const [notification, setNotification] = useState<{type:string;message:string}|null>(null);



  useEffect(() => {
    fetch('http://localhost:5000/warehouse/get-drivers')
      .then(response => response.json())
      .then(data => setDrivers(data));

    fetch('http://localhost:5000/warehouse/get-assistants')
      .then(response => response.json())
      .then(data => setAssistants(data));

    fetch('http://localhost:5000/warehouse/get-vehicles')
    .then(response => response.json())
    .then(data => setTrucks(data))

   
  }, []);

  const handleSubmit = async (event: React.FormEvent<HTMLFormElement>) => {
    event.preventDefault();
    const data = {
      bulk_id: props.bulk.ID,
      order_id: props.bulk.order,
      driver_id: selectedDriver,
      assistant_id: selectedAssistant,
      vehicle_id: selectedTruck,
      schedule_time: scheduleTime,
      schedule_date: scheduleDate
    }

    const response =  await fetch('http://localhost:5000/warehouse/send-bulk', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(data),
    })

    const result = await response.json();

    if (result.ok) {
      setNotification({
        type: "success",
        message: "Bulk Sending successful!",
      });
    } else {
      setNotification({
        type: "error",
        message: "Bulk sending failed.",
      });
    }

    
  
  };



  return (

    <div>
    <form onSubmit={handleSubmit}>
      <div className="form-group">
        <label htmlFor="driverSelect">Driver</label>
        <select className="form-control" id="driverSelect" onChange={(event) => setSelectedDriver(parseInt(event.target.value))}>
          <option value="0">Select driver</option>
          {drivers.map(driver => (
            <option key={driver.user_id} value={driver.user_id}>{driver.user_id}</option>
          ))}
        </select>
      </div>

      <div className="form-group">
        <label htmlFor="assistantSelect">Assistant</label>
        <select className="form-control" id="assistantSelect" onChange={(event) => setSelectedAssistant(parseInt(event.target.value))}>
          <option value="0">Select assistant</option>
          {assistants.map(assistant => (
            <option key={assistant.user_id} value={assistant.user_id}>{assistant.user_id}</option>
          ))}
        </select>
      </div>

      <div className="form-group">
        <label htmlFor="truckSelect">Truck</label>
        <select className="form-control" id="truckSelect" onChange={(event) => setSelectedTruck(event.target.value)}>
          <option value="0">Select Truck</option>
          {trucks.map(truck => (
            <option key={truck.registration_id} value={truck.registration_id}>{truck.registration_id}</option>
          ))}
        </select>
      </div>

      <div className="form-group">
        <label htmlFor="scheduleTime">Schedule Time</label>
        <input type="time" className="form-control" id="scheduleTime" onChange={(event) => setScheduleTime(event.target.value)} />
      </div>

      <div className="form-group">
        <label htmlFor="scheduleDate">Schedule Date</label>
        <input type="date" className="form-control" id="scheduleDate" onChange={(event) => setScheduleDate(event.target.value)} />
      </div>

      <button type="submit" className="btn btn-primary">
        Submit
      </button>
    </form>
    {notification && (
        <div>
            <div className={`alert alert-${notification.type}`} role="alert">
              {notification.message}
            </div>
            <button className="btn btn-primary">Go Back</button>
        </div>
      )}
    </div>
  );
};

export default SendBulk;