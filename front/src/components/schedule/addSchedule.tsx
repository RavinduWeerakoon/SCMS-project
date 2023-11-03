import { useState, useEffect } from "react";

interface Train {
  id: number;
  name: string;
}

interface AddScheduleProps {
  onSubmit: (date: string, time: string, trainId: number) => void;
}

const AddSchedule =  () => {
  const [trains, setTrains] = useState<Train[]>([]);
  const [date, setDate] = useState<string>("");
  const [time, setTime] = useState<string>("");
  const [trainId, setTrainId] = useState<number>(0);
  const [showSuccess, setShowSuccess] = useState<boolean>(false);

  useEffect(() => {
    fetch("http://localhost:5000/trainmanager/get-trains")
      .then((response) => response.json())
      .then((data) => setTrains(data));
  }, []);

  const handleSubmit = (event: React.FormEvent<HTMLFormElement>) => {

    event.preventDefault();
    alert("Schedule added successfully!");  
    // if (date && time && trainId) 
    const data = { date, time, trainId };

    fetch("http://localhost:5000/trainmanager/add-schedule", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(data),
    }).then((res)=>{
      if(res.ok){
        setShowSuccess(true);
      }else{
        alert("Error");
      }
    })
  };

  return (
    <div className="container">
      <div className="mx-auto row">
        <div className="width-50 justify-content-center">
          <h3>Add Schedule</h3>
          <hr />
          <form onSubmit={handleSubmit}>
            <div className="form-group">
              <label htmlFor="train-select">Select a train:</label>
              <select
                id="train-select"
                className="form-control"
                value={trainId}
                onChange={(event) => setTrainId(Number(event.target.value))}
              >
                <option value="">-- Select a train --</option>
                {trains.map((train) => (
                  <option key={train.id} value={train.id}>
                    {train.name}
                  </option>
                ))}
              </select>
            </div>
            <div className="form-group">
              <label htmlFor="date-input">Date:</label>
              <input
                id="date-input"
                className="form-control"
                type="date"
                value={date}
                onChange={(event) => setDate(event.target.value)}
              />
            </div>
            <div className="form-group">
              <label htmlFor="time-input">Time:</label>
              <input
                id="time-input"
                className="form-control"
                type="time"
                value={time}
                onChange={(event) => setTime(event.target.value)}
              />
            </div>
            <button type="submit" className="btn btn-primary">
              Add Schedule
            </button>
          </form>
        </div>

        {showSuccess && (
            <div className="col-md-12">
              <div className="alert alert-success" role="alert">
                Schedule added successfully!
              </div>
            </div>)}
      </div>
    </div>
  );
};

export default AddSchedule;