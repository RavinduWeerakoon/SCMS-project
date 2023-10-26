import React, { useState, useEffect } from 'react';
import axios from 'axios';

interface TrainSchedule {
    date: string;
    available_capacity: number;
    time: string;
    destinations:string;
}

const TrainSchedule = () => {
    const [trainSchedules, setTrainSchedules] = useState<TrainSchedule[]>([]);

    useEffect(() => {
        const fetchTrainSchedules = async () => {
            // try {
            //     const response = await axios.get('/api/train-schedules');
            //     setTrainSchedules(response.data);
            // } catch (error) {
            //     console.error(error);
            // }

            fetch("http://localhost:5000/trainmanager/get-schedule")
            .then((response) => response.json())
            .then((data) => setTrainSchedules(data));
        };

        fetchTrainSchedules();
    }, []);

    return (
        <div>
            <h1>Train Schedule</h1>
            <table>
                <thead>
                    <tr>
                        <th>Date</th>
                        <th>Available Capacity</th>
                        <th>Time</th>
                        <th>Capacity</th>
                    </tr>
                </thead>
                <tbody>
                    {trainSchedules.map((trainSchedule,index) => (
                        <tr key={index}>
                            <td>{trainSchedule.date}</td>
                            <td>{trainSchedule.available_capacity}</td>
                            <td>{trainSchedule.time}</td>
                            
                        </tr>
                    ))}
                </tbody>
            </table>
        </div>
    );
};

export default TrainSchedule;
