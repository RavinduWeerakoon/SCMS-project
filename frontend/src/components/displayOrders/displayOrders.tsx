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

      <div className="table-responsive mb-20">
      <table className="table table-dark-light table-borderless" style={{}}>
      <thead>
              <tr>
              <th className="py-4 px-4 bg-dark-light text-secondary-light" data-config-id="auto-txt-4-4">Order ID</th>
              <th className="ps-14 py-4 px-4 bg-dark-light rounded-start text-secondary-light" data-config-id="auto-txt-3-4">Placement Date</th>
              <th className="py-4 px-4 bg-dark-light text-secondary-light" data-config-id="auto-txt-5-4">Feature 2</th>
              <th className="py-4 px-4 bg-dark-light text-secondary-light" data-config-id="auto-txt-6-4">Feature 3</th>
              <th className="pe-14 py-4 px-4 bg-dark-light rounded-end text-secondary-light" data-config-id="auto-txt-7-4">Feature 4</th></tr>
              </thead>

              <tbody>
              {orders.map((order) => (
                <tr key={order.ID}>
                  <td className="py-5 px-4 align-middle border-bottom text-secondary-light" data-config-id="auto-txt-11-4">{order.ID}</td>
                  <td className="py-5 px-4 align-middle border-bottom text-secondary-light">{order.date_ordered}</td>
                  <td className="py-5 px-4 align-middle border-bottom text-secondary-light" data-config-id="auto-txt-11-4">{order.remained_count}</td>
                  <td className="py-5 px-4 align-middle border-bottom text-secondary-light" data-config-id="auto-txt-11-4">{order.qty}</td>
                  <td  className="py-5 px-4 align-middle border-bottom text-secondary-light">
                    <Button variant="contained" color="success" onClick={() => openModal(order)}>Send</Button>
                  </td>
                </tr>
              
              ))};
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

