
import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import "./register.scss"


const Register: React.FC = () => {
  const [email, setEmail] = useState('');
  const [contactNo, setContactNo] = useState('');
  const [name, setName] = useState('');
  const [password, setPassword] = useState('');
  const [customerType, setCustomerType] = useState('');
  
  const navigate = useNavigate();
  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();

    try {
      const response = await fetch('http://localhost:5000/auth/signup', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ email, contact_no: contactNo, name, password, customer_type: customerType }),
      });

      if (response.ok) {
        navigate("/login");
      } else {
        console.error('Registration failed');
      }
    } catch (error) {
      console.error('There was an error!', error);
    }
  };


  return (

    <div className='row'>

    <div className='theme-form col-md-6 mx-auto' style={{width:"600px"}}>
      <h2>Register</h2>
    <form onSubmit={handleSubmit} className="mt-3">
      <div className="form-group">
        <label htmlFor="email">Email</label>
        <input type="email" className="form-control" id="email" value={email} onChange={e => setEmail(e.target.value)} placeholder="Email" required />
      </div>
      <div className="form-group">
        <label htmlFor="contactNo">Contact No</label>
        <input type="tel" className="form-control" id="contactNo" value={contactNo} onChange={e => setContactNo(e.target.value)} placeholder="Contact No" required />
      </div>
      <div className="form-group">
        <label htmlFor="name">Name</label>
        <input type="text" className="form-control" id="name" value={name} onChange={e => setName(e.target.value)} placeholder="Name" required />
      </div>
      <div className="form-group">
        <label htmlFor="password">Password</label>
        <input type="password" className="form-control" id="password" value={password} onChange={e => setPassword(e.target.value)} placeholder="Password" required />
      </div>
      <div className="form-group">
        <label htmlFor="customerType">Customer Type</label>
        <input type="text" className="form-control" id="customerType" value={customerType} onChange={e => setCustomerType(e.target.value)} placeholder="Customer Type" required />
      </div>
      <button type="submit" className="btn btn-primary">Register</button>
    </form>
    </div>
    </div>
  );
};

export default Register;