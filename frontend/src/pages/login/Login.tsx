import React, { useState } from "react";
import axios from "axios";
import { useNavigate } from "react-router-dom";

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
      // Make an API call to log in the user
      const response = await axios.post("http://localhost:5000/auth/login", formData);

      // If the login is successful, store the user's token in local storage
      localStorage.setItem("token", response.data.token);

      // Redirect the user to dashboard after a successful login
      navigate("/");
    } catch (error) {
      // Handle the error
      console.log(error);
    }
  };

  return (
    <div>
      <h1>Login</h1>

      <form onSubmit={handleSubmit}>
        <input
          type="text"
          name="email"
          placeholder="Username"
          value={formData.email}
          onChange={handleInputChange}
        />

        <input
          type="password"
          name="password"
          placeholder="Password"
          value={formData.password}
          onChange={handleInputChange}
        />

        <button type="submit">Login</button>
      </form>
    </div>
  );
};

export default Login;