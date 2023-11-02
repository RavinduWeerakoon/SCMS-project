import React, { useState } from 'react';

interface Product {
  ID: number;
  name: string;
  type: string;
  description: string;
  unit_capacity: number;
  unit_price: number;
}

interface DisplayProductProps {
  product: Product;
}






const DisplayProduct: React.FC<DisplayProductProps> = ({ product }) => {

    return (
    <div className="card">
      <div className="card-body">
        <h5 className="card-title">{product.name}</h5>
        <h6 className="card-subtitle mb-2 text-muted">{product.type}</h6>
        <p className="card-text">{product.description}</p>
        <ul className="list-group list-group-flush">
          <li className="list-group-item">ID: {product.ID}</li>
          <li className="list-group-item">Unit Capacity: {product.unit_capacity}</li>
          <li className="list-group-item">Unit Price: {product.unit_price}</li>
        </ul>
      </div>
    </div>
  );
};

export default DisplayProduct;