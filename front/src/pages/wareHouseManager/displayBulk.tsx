import { useEffect, useState } from 'react';
import { json } from 'react-router-dom';

import ConfirmBulk  from './confirmBulk';
import SendBulk  from './sendBulk';

// import SendOrder from "../sendOrder"
import Box from '@mui/material/Box';
import Button from '@mui/material/Button';
import Typography from '@mui/material/Typography';
import Modal from '@mui/material/Modal';


// {"ID":11,"order":1,"sending_quantity":"3.00","delivery_address":"No 3,Elliot road,Colombo","confirmed":null,"sent":null},

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

interface TrainBulk {
  ID: number;
  order: number;
  sending_quantity: number;
  delivery_address: string;
  confirmed: boolean;
  sent: boolean;
}

const DisplayBulk = () => {
  const [trainBulkList, setTrainBulkList] = useState<TrainBulk[]>([]);
  const [selectedConfirmItem, setSelectedConfirmItem] = useState<TrainBulk|null>(null);
  const [selectedSendItem, setSelectedSendItem] = useState<TrainBulk>();
  const [openConfirm, setOpenConfirm] = useState(false);
  const [openSend, setOpenSend] = useState(false);

  const handleConfirmopen = (bulk:TrainBulk) => {
    setOpenConfirm(true);
    setSelectedConfirmItem(bulk);
  };

  const closeConfirm = () => {

    setOpenConfirm(false);

  };


  const handleSendConfirm = (bulk:TrainBulk)=>{
    setSelectedSendItem(bulk);
    setOpenSend(true);
  }

  const closeSend = () => {
    setOpenSend(false)
  }


  useEffect(() => {

    fetch("http://localhost:5000/warehouse/get-bulks")
    .then((response) => response.json())
    .then((data) => setTrainBulkList(data[0]));
}, []);



  const handleConfirmBulk = (id: number) => {
    setTrainBulkList(prevState => prevState.map(trainBulk => {
      if (trainBulk.ID === id) {
        return { ...trainBulk, confirmed: true };
      }
      return trainBulk;
    }));
  };

  const handleSendBulk = (id: number) => {
    console.log(`Sending bulk with ID ${id}`);
  };

  return (
    <div>
      <h1>Train Bulk Details</h1>
      

      <table className="table mt-3">
        <thead>
          <tr>
            <th>ID</th>
            <th>Order ID</th>
            <th>Sending Quantity</th>
            <th>Sending Address</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          {trainBulkList.map(trainBulk => (
            <tr key={trainBulk.ID}>
              <td>{trainBulk.ID}</td>
              <td>{trainBulk.order}</td>
              <td>{trainBulk.sending_quantity}</td>
              <td>{trainBulk.delivery_address}</td>
              <td>
                <button type="button" className="btn btn-success" onClick={() => handleConfirmopen(trainBulk)} disabled={trainBulk.confirmed}>
                  {trainBulk.confirmed ? 'Confirmed' : 'Confirm'}
                </button>
                {/* <button type="button" className="btn btn-primary ml-2" onClick={() => handleSendBulk(trainBulk.ID)} disabled={!trainBulk.confirmed}> */}
                <button type="button" className="btn btn-primary ml-2" onClick={() => handleSendConfirm(trainBulk)}>
                  Send
                </button>
              </td>
            </tr>
          ))}
        </tbody>
      </table>

      {selectedConfirmItem?.ID && (
      <Modal
      open={openConfirm}
      onClose={closeConfirm}
      aria-labelledby="modal-modal-title"
      aria-describedby="modal-modal-description"
    >
      <Box sx={style}>
          <ConfirmBulk/>
      </Box>
    </Modal>
          )}


{selectedSendItem?.ID && (
      <Modal
      open={openSend}
      onClose={closeSend}
      aria-labelledby="modal-modal-title"
      aria-describedby="modal-modal-description"
    >
      <Box sx={style}>
            <SendBulk bulk={selectedSendItem}/>
      </Box>
    </Modal>
          )}

    </div>
  );
};

export default DisplayBulk;