import React, { useEffect, useState } from 'react';
import Box from '@mui/material/Box';
import Button from '@mui/material/Button';
import Typography from '@mui/material/Typography';
import Modal from '@mui/material/Modal';

import DisplayProduct from './displayProduct';
import BuyProduct from './buyProduct';

interface Product {
  ID: number;
  name: string;
  type: string;
  description: string;
  unit_capacity: number;
  unit_price: number;
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


const ProductList: React.FC = () => {
  const [products, setProducts] = useState<Product[]>([]);
  const [SelectedShowItem, setSelectedShowItem] = useState<Product|null>(null);
  const [SelectedBuyItem, setSelectedBuyItem] = useState<Product|null>(null);
  const [showConfirm, setShowConfirm] = useState(false);
  const [openBuy, setOpenBuy] = useState(false);

  const handleShowopen = (product:Product) => {
      setShowConfirm(true);
      setSelectedShowItem(product);
    };
  
    const closeConfirm = () => {
  
      setShowConfirm(false);
  
    };

    const handleBuyOpen= (product:Product)=>{
        setOpenBuy(true);
        setSelectedBuyItem(product);
    }

    const closeBuy = () => {
        setOpenBuy(false);
    }




  useEffect(() => {

    fetch("http://localhost:5000/customer/products")
    .then((response) => response.json())
    .then((data) => setProducts(data));
}, []);

  return (
    <div>
    <table className="table">
      <thead>
        <tr>
          <th>ID</th>
          <th>Name</th>
          <th>Type</th>
          <th>Unit Price</th>
          <th>Actions</th>
        </tr>
      </thead>
      <tbody>
        {products.map(product => (
          <tr key={product.ID}>
            <td>{product.ID}</td>
            <td>{product.name}</td>
            <td>{product.type}</td>
            <td>{product.unit_price}</td>
            <td>
                <button className="btn btn-primary" onClick={() => handleShowopen(product)}>Details</button>
                <button className="btn btn-success" onClick={()=> handleBuyOpen(product)}>Buy</button>
            </td>
          </tr>
        ))}
      </tbody>
    </table>
{/* 
    <Modal
      open={openConfirm}
      onClose={closeConfirm}
      aria-labelledby="modal-modal-title"
      aria-describedby="modal-modal-description"
    > */}

    {SelectedShowItem?.ID && (
      <Modal
    //   open={openBuy}
      open = {showConfirm}
      onClose={closeConfirm}
      aria-labelledby="modal-modal-title"
      aria-describedby="modal-modal-description"
    >
      <Box sx={style}>
            <DisplayProduct product={SelectedShowItem}/>
      </Box>
    </Modal>
          )}

    {SelectedShowItem?.ID && (
      <Modal
      open={openBuy}
      onClose={closeBuy}
      aria-labelledby="modal-modal-title"
      aria-describedby="modal-modal-description"
    >
      <Box sx={style}>
           <BuyProduct product={SelectedShowItem}/>
      </Box>
    </Modal>
          )}
    
    </div>
  );
};

export default ProductList;