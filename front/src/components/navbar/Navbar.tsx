import { Link } from "react-router-dom";
import "./navbar.scss";

const Navbar = () => {


  return (
    <div className="mx-auto" style={{maxWidth:"90%"}}>
    <header className="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
      <h3 className="text-primary">A Company</h3>

      {/* <ul className="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
        <li><a href="#" className="nav-link px-2 link-secondary">Home</a></li>
        <li><Link to={'logout'} className="nav-link px-2 link-secondary">Logout</Link></li>
        
      </ul> */}

      <div className="col-md-3 text-end">
        <Link to={"/"}  className="btn btn-outline-primary me-2">Logout</Link>
      
      </div>
    </header>
  </div>
  );
};

export default Navbar;
