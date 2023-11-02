import React, { useEffect, useState } from 'react';
import axios from 'axios';

interface Product {
  ID: number;
  name: string;
  type: string;
  description: string;
  unit_capacity: number;
  unit_price: number;
}

interface Path {
  ID: number;
  warehouse: string;
  destinations: string;
}

interface BuyProductProps {
  product: Product;
}

const BuyProduct: React.FC<BuyProductProps> = ({ product }) => {
  const [quantity, setQuantity] = useState<number>(1);
  const [paths, setPaths] = useState<Path[]>([]);
  const [selectedPath, setSelectedPath] = useState<number>(0);
  const [price,setPrice] = useState<number>(0);

  const[address,setAddress] = useState<string>("");

  const [showSuccess, setShowSuccess] = useState<boolean>(false);

  useEffect(() => {
    axios.get<Path[]>('http://localhost:5000/customer/getPaths')
      .then(response => {
        setPaths(response.data);
      })
      .catch(error => {
        console.error('There was an error!', error);
      });
  }, []);

  const handleSubmit = async (event: React.FormEvent) => {
    event.preventDefault();
    const date = new Date();
    const data = {
        product_id: product.ID,
        date_ordered:date.toISOString().slice(0, 10),
        path: selectedPath,
        quantity: quantity,
        price:price,
        delivery_address:address
        
    }

    await fetch("http://localhost:5000/customer/createOrder", {
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
    <form onSubmit={handleSubmit}>
      <div className="form-group">
        <label htmlFor="quantity">Quantity:</label>
        <input
          type="number"
          id="quantity"
          className="form-control"
          value={quantity}
          onChange={(event) => {setQuantity(Number(event.target.value))
                                setPrice(Number(event.target.value)*product.unit_price)}}
        />
      </div>
      <div className="form-group">
        <label htmlFor="path-select">Select a path:</label>
        <select
          id="path-select"
          className="form-control"
          value={selectedPath}
          onChange={(event) => setSelectedPath(Number(event.target.value))}
        >
          <option value="">-- Select a path --</option>
          {paths.map((path) => (
            <option key={path.destinations} value={path.ID}>
              {path.warehouse} - {path.destinations}
            </option>
          ))}
        </select>
      </div>

    
       <div className="form-group">
        <label htmlFor="address">Delivery Address:</label>
        <input
          type="text"
          id="address"
          className="form-control"
          value={address}
          onChange={(event) => setAddress(event.target.value)}/>
        </div>

      <p className="h4 text-primary">The price is {price}</p>
      <button type="submit" className="btn btn-primary">Buy</button>
      {showSuccess && (
            <div className="col-md-12">
              <div className="alert alert-success" role="alert">
                Schedule added successfully!
              </div>
      </div>)}
    </form>
  );
};

export default BuyProduct;