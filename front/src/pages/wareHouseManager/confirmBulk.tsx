import {useState, useEffect} from 'react';


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
  
  const ConfirmBulk: React.FC<bulkProps> = ({ bulk }) => {
    const [isConfirmed, setIsConfirmed] = useState(false);
  
    const confirm = async () => {
      try {
        const response = await fetch('http://localhost:5000/trainmanager/confirm-order', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify({ bulk_id:bulk.ID }),
        });
  
        if (response.ok) {
          setIsConfirmed(true);
          console.log('Confirmation successful');
        } else {
          console.error('Confirmation failed');
        }
      } catch (error) {
        console.error('There was an error!', error);
      }
    };
  
    return (
      <div>
        <h1>Confirm</h1>
        {isConfirmed && <div className="alert alert-success" role="alert">Bulk confirmed successfully!</div>}
        <button className='btn btn-danger' onClick={confirm}>Confirm</button>
      </div>
    );
  };
  

export default ConfirmBulk;
