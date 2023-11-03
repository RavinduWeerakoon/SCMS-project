import { useState, useEffect, SetStateAction } from "react";
import { Link } from "react-router-dom";

import "./displayOrders.scss";

import SendOrder from "../sendOrder"
import Box from '@mui/material/Box';
import Button from '@mui/material/Button';
import Typography from '@mui/material/Typography';
import Modal from '@mui/material/Modal';


interface Order {
    ID: number;
    remained_count: string;
    qty: string;
    date_ordered: string;
    unit_capacity:number;
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


function DisplayOrders() {
    const [open, setOpen] = useState(false);
    const [orders, setOrders] = useState<Order[]>([]);
    const [selectedItem, setSelectedItem] = useState<Order>();


    const openModal = (order:Order) => {
        setOpen(true);
        setSelectedItem(order);
      };
    
      const closeModal = () => {

        setOpen(false);

      };
   

    useEffect(() => {
        // Fetch unsent orders from the database
        fetch("http://localhost:5000/trainmanager/get-incompleted")
            .then((response) => response.json())
            .then((data) => setOrders(data));
    }, []);


    return(

      <div className="mb-20">
      <table className="table" >
          <thead>
          <tr>
            <th>Order ID</th>
            <th>Placement Date</th>
            <th>To be sent</th>
            <th>Order Qty</th>
            <th>Actions</th>
          </tr>
        </thead>
    
              <tbody>
              {orders.map((order) => (
                <tr key={order.ID}>
                  <td>{order.ID}</td>
                  <td>{order.date_ordered}</td>
                  <td>{order.remained_count}</td>
                  <td>{order.qty}</td>
                  <td>
                    <Button variant="contained" color="primary" onClick={() => openModal(order)}>
                      Send
                    </Button>
                  </td>
                </tr>
              ))}
            </tbody>
      </table>

    {selectedItem?.ID && (
      <Modal
      open={open}
      onClose={closeModal}
      aria-labelledby="modal-modal-title"
      aria-describedby="modal-modal-description"
    >
      <Box sx={style}>
          <SendOrder order = {selectedItem}/>
      </Box>
    </Modal>
          )}
      </div>


    );

};

export default DisplayOrders;

