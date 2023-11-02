import React, { useState } from "react";
import axios from "axios";
import { useNavigate } from "react-router-dom";
import './login.scss'

interface LoginFormData {
  email: string;
  password: string;
}

const Login: React.FC = () => {
  const [formData, setFormData] = useState<LoginFormData>({
    email: "",
    password: "",
  });
  const navigate = useNavigate();

  const handleInputChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    setFormData({ ...formData, [e.target.name]: e.target.value });
  };

  const handleSubmit = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();

    try {

      const response = await  fetch("http://localhost:5000/auth/login", {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
        },
        body: JSON.stringify(formData),
    });
      // Make an API call to log in the user
     const data = await response.json();

     if(data.type==="customer"){
      navigate("/customer");
     }else if (data.type==="manager"){
      navigate("/admin");
     }else if (data.type==="t_manager"){
      navigate("/tmanager")
     }else if (data.type==="s_manager"){
      navigate("/warehouse")
     }

     

     
      // If the login is successful, store the user's token in local storage
      

      // Redirect the user to dashboard after a successful login
    
    } catch (error) {
      // Handle the error
      console.log(error);
    }
  };

  return (
    <div>
        <header id="header" className="header fixed-top">
    <div className="container-fluid container-xl d-flex align-items-center justify-content-between">

      <a href="index.html" className="logo d-flex align-items-center">
        <img src="logo.png" alt=""/>
        <span>A Company</span>
      </a>



    </div>
  </header>


  <section id="hero" className="hero d-flex align-items-center">

    <div className="container">
      <div className="row">
        <div className="col-lg-6 d-flex flex-column justify-content-center">
           
<form onSubmit={handleSubmit}>
  <h3><div className="text"><b>Login Here</b></div></h3>
  <label htmlFor="username">User name</label>
  {/* <input type="text" placeholder="Email or Phone" id="username" /> */}
  
        <input
          type="text"
          name="email"
          id="username"
          placeholder="Username"
          value={formData.email}
          onChange={handleInputChange}
        />

  <label htmlFor="password">Password</label>
  
  <input
          type="password"
          name="password"
          placeholder="Password"
          value={formData.password}
          onChange={handleInputChange}
        />
  
  <div className="text-center text-lg-start">
    <button type="submit" className="btn-get-started scrollto d-inline-flex align-items-center justify-content-center align-self-center">
      <span className="spanme">Login</span>
      <i className="bi bi-arrow-right"></i>
    </button>
  </div>
  <p className="signin">Dont't you have an account? <a>sign in.</a></p>
</form>
						  
        </div>
        <div className="col-lg-6 hero-img" >
         
        </div>
      </div>
    </div>

  </section>
  </div>

 

  
  );
};

export default Login;