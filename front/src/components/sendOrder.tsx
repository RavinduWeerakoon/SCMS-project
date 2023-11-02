import React, { useEffect, useState } from "react";
import { json } from "react-router-dom";

import TrainSchedule from "./trainSchedule/trainSchedule";


interface Train {
    schedule_id:string,
    date: string;
    available_capacity: number;
    train_id: string;  
    time: string;

}

interface Order {
    ID: number;
    remained_count: string;
    qty: string;
    date_ordered: string;
    unit_capacity: number;
    
}
interface Destination {
  city_name: string;
}

interface  sendProps{
    order : Order
}

const SendOrder: React.FC<sendProps> = (props) => {
    const [trains, setTrains] = useState<Train[]>([]);
    const [selectedTrain, setSelectedTrain] = useState<Train | null>(null);
    const [quantity, setQuantity] = useState<number>(1);
    const [destination, setDestination] = useState<string>("");
    const [remainingCapacity, setRemainingCapacity] = useState<number>(0);

    const [notification, setNotification] = useState<{type:string;message:string}|null>(null);

    const [destinations, setDestinations] = useState<Destination[]>([]);
    const [showSuccess, setShowSuccess] = useState<boolean>(false);

    // Fetch the list of available trains from the API
    useEffect(() => {

        fetch("http://localhost:5000/trainmanager/get-schedule")
        .then((response) => response.json())
        .then((data) => setTrains(data));
    }, []);

    // // Calculate the remaining capacity of the selected train based on the current quantity
    // const remainingCapacity = selectedTrain ? selectedTrain.available_capacity - quantity : 0;

    useEffect(() => {
      fetch("http://localhost:5000/trainmanager/get-destinations")
        .then((response) => response.json())
        .then((data) => setDestinations(data));
    }, []);


    // Handle the form submission

    const handleChange = async (event:React.ChangeEvent<HTMLInputElement>) => {
        const init_capacuty = selectedTrain?.available_capacity as number;
        setRemainingCapacity(init_capacuty-Number(Number(event.target.value)* props.order.unit_capacity));
        setQuantity(Number(event.target.value));
    }
    
    // const handleSubmit = async (event:React.FormEvent<HTMLFormElement>) => {
    //     console.log(event);
    // }
    const handleSubmit = async (event:React.FormEvent<HTMLFormElement>) => {
        event.preventDefault();
        alert("Fuck");
        
        const data = {
            order_id: props.order.ID,
            train_schedule_id: selectedTrain?.schedule_id,
            quantity: quantity,
            destination :destination,
            train : selectedTrain?.train_id
        };
      
        

        await fetch("http://localhost:5000/trainmanager/send-order", {
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
  <div className="row w-100">
    <div className="col-md-6">
      <h3>Send Order</h3>
      <hr />
      <form onSubmit={handleSubmit}>
        <div className="form-group">
          <label htmlFor="train-select">Select a train:</label>
          <select
            id="train-select"
            className="form-control"
            value={selectedTrain?.schedule_id}
            onChange={(event) => {
              const selected = trains[Number(event.target.value)];
              setSelectedTrain(selected);
              setRemainingCapacity(selected.available_capacity);
            }}
          >
            <option value="">-- Select a train --</option>
            {trains.map((train) => (
              <option key={train.schedule_id} value={train.schedule_id}>
                {train.time} ({train.available_capacity} seats)
              </option>
            ))}
          </select>
        </div>

        <div className="form-group">
          <label htmlFor="quantity-input">Quantity:</label>
          <input
            id="quantity-input"
            className="form-control"
            type="number"
            value={quantity}
            onChange={handleChange}
          />
        </div>

        <div className="form-group">
        <label htmlFor="city-select">Select a city:</label>
        <select id="city-select" 
          className="form-control"
          onChange={(e)=>{
            setDestination(String(e.target.value));
          }}>
          <option value="">-- Select a city --</option>
          


          {destinations.map((city, index) => (
            <option key={index} value={city.city_name}>
              {city.city_name}
            </option>
          ))}
          className="btn btn-primary mt-3"
          disabled={selectedTrain == null}
        
        </select>

        <p className="my-3 h4 text-danger">Remaining Capacity :{remainingCapacity}</p>
        </div>
        <button type="submit" className="btn btn-primary mt-3" disabled={selectedTrain == null}>
          Send Order
        </button>


      
      
      </form>
    </div>
    <div className="col-md-6">
        <TrainSchedule/>
    </div>
    
    {showSuccess && (
            <div className="col-md-12">
              <div className="alert alert-success" role="alert">
                Schedule added successfully!
              </div>
      </div>)}
    
    {notification && (
        <div>
            <div className={`alert alert-${notification.type}`} role="alert">
             
            </div>
            <button className="btn btn-primary">Go Back</button>
        </div>
      )}
  </div>
</div>
    );
};

export default SendOrder;
