import { useState, useEffect } from 'react';

interface Driver {
  id: number;
  name: string;
}

interface Assistant {
  id: number;
  name: string;
}

const SendBulk = () => {
  const [drivers, setDrivers] = useState<Driver[]>([]);
  const [assistants, setAssistants] = useState<Assistant[]>([]);
  const [selectedDriver, setSelectedDriver] = useState<number>(0);
  const [selectedAssistant, setSelectedAssistant] = useState<number>(0);
  const [scheduleTime, setScheduleTime] = useState<string>('');
  const [scheduleDate, setScheduleDate] = useState<string>('');

  useEffect(() => {
    fetch('/get_drivers')
      .then(response => response.json())
      .then(data => setDrivers(data));

    fetch('/get_assistants')
      .then(response => response.json())
      .then(data => setAssistants(data));
  }, []);

  const handleSubmit = (event: React.FormEvent<HTMLFormElement>) => {
    event.preventDefault();
    console.log('Selected driver:', selectedDriver);
    console.log('Selected assistant:', selectedAssistant);
    console.log('Schedule time:', scheduleTime);
    console.log('Schedule date:', scheduleDate);
  };

  return (
    <form onSubmit={handleSubmit}>
      <div className="form-group">
        <label htmlFor="driverSelect">Driver</label>
        <select className="form-control" id="driverSelect" onChange={(event) => setSelectedDriver(parseInt(event.target.value))}>
          <option value="0">Select driver</option>
          {drivers.map(driver => (
            <option key={driver.id} value={driver.id}>{driver.name}</option>
          ))}
        </select>
      </div>

      <div className="form-group">
        <label htmlFor="assistantSelect">Assistant</label>
        <select className="form-control" id="assistantSelect" onChange={(event) => setSelectedAssistant(parseInt(event.target.value))}>
          <option value="0">Select assistant</option>
          {assistants.map(assistant => (
            <option key={assistant.id} value={assistant.id}>{assistant.name}</option>
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
  );
};

export default SendBulk;