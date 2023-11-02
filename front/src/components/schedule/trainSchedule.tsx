import React, { useState, useEffect } from 'react';
import axios from 'axios';

import Box from '@mui/material/Box';
import Button from '@mui/material/Button';
import Typography from '@mui/material/Typography';
import Modal from '@mui/material/Modal';

import AddSchedule  from './addSchedule';
import Add from '../buyProducts';


interface TrainSchedule {
    date: string;
    available_capacity: number;
    time: string;
    destinations:string;
}

const style = {
    position: 'absolute' as 'absolute',
    top: '50%',
    left: '50%',
    transform: 'translate(-50%, -50%)',
    width:"80%",
    height:"90%",
    bgcolor: 'background.paper',
    border: '2px solid #000',
    boxShadow: 24,
    p: 4,
};

const TrainSchedule = () => {
    const [trainSchedules, setTrainSchedules] = useState<TrainSchedule[]>([]);
    const [selectedRow, setSelectedRow] = useState<number | null>(null);

    const [open, setOpen] = React.useState(false);
    const handleOpen = () => setOpen(true);
    const handleClose = () => setOpen(false);

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
        <h3>Train Schedule</h3>
        <Button variant="contained" color="success" onClick={handleOpen}>Add Schedule</Button>
        <hr/>
        <div className="table-responsive">
          <table className="table table-striped table-light">
            <thead>
              <tr>
                <th>Date</th>
                <th>Available Capacity</th>
                <th>Time</th>
              </tr>
            </thead>
            <tbody>
              {trainSchedules.map((trainSchedule, index) => (
                <tr
                  key={index}
                  className={selectedRow === index ? "table-active" : ""}
                  onClick={() => setSelectedRow(index)}
                >
                  <td>{trainSchedule.date}</td>
                  <td>{trainSchedule.available_capacity}</td>
                  <td>{trainSchedule.time}</td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>


        <Modal
        open={open}
        onClose={handleClose}
        aria-labelledby="modal-modal-title"
        aria-describedby="modal-modal-description"
      >
        <Box sx={style}>
                
                <AddSchedule/>
        </Box>
      </Modal>
      </div>
      );
};

export default TrainSchedule;
