import React, { useEffect, useState } from "react";
import { json } from "react-router-dom";


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
    
}

interface  sendProps{
    order : Order
}

const SendOrder: React.FC<sendProps> = (props) => {
    const [trains, setTrains] = useState<Train[]>([]);
    const [selectedTrain, setSelectedTrain] = useState<Train | null>(null);
    const [quantity, setQuantity] = useState<number>(1);
    const [destination, setDestination] = useState<number>(1);
    const [remainingCapacity, setRemainingCapacity] = useState<number>(0);

    // Fetch the list of available trains from the API
    useEffect(() => {

        fetch("http://localhost:5000/trainmanager/get-schedule")
        .then((response) => response.json())
        .then((data) => setTrains(data));
    }, []);

    // // Calculate the remaining capacity of the selected train based on the current quantity
    // const remainingCapacity = selectedTrain ? selectedTrain.available_capacity - quantity : 0;


    // Handle the form submission

    const handleChange = async (event:React.ChangeEvent<HTMLInputElement>) => {
        const init_capacuty = selectedTrain?.available_capacity as number;
        setRemainingCapacity(init_capacuty-Number(event.target.value));
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
      

        try {
            // Send the order to the API
            await fetch("http://localhost:5000/trainmanager/send-order", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                },
                body: JSON.stringify(data),
            });

            // Display success message
            alert("Order has been sent!");
        } catch (error) {
            // Display error message
            alert("Error sending order. Please try again.");
        }
    };

   

    return (
        <div>
            <h1>Send Order</h1>
            <form onSubmit={handleSubmit}>
                <label>
                    Select a train:
                    <select value={selectedTrain?.schedule_id} onChange={(event) => {
                                                                                    const selected = trains[Number(event.target.value)];
                                                                                    setSelectedTrain(selected);
                                                                                    setRemainingCapacity(selected.available_capacity);}}>
                        <option value="">-- Select a train --</option>
                        {trains.map((train) => (
                            <option key={train.schedule_id} value={train.schedule_id}>
                                {train.time} ({train.available_capacity} seats)
                            </option>
                        ))}
                    </select>
                </label>

                
                <input id="value-input" type="number" value={quantity} onChange={handleChange}/>

                
                <p>Remaining capacity: {remainingCapacity}</p>
                <button type="submit" disabled={selectedTrain==null} >
                    Send Order
                </button>
            </form>
        </div>
    );
};

export default SendOrder;
