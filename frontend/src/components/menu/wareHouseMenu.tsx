import { Link } from "react-router-dom";
import "./Menu.scss";


const menu = [
    {id: 1,
    title: "main",
    listItems: [
      {
        id: 1,
        title: "Homepage",
        url: "/",
        icon: "home.svg",
      }]
    }
]



  const WareHouseMenu = () =>  {
    return (
      <div className="menu" style={{height:"100vh"}}>
        {menu.map((item) => (
          <div className="item" key={item.id}>
            <span className="title">{item.title}</span>
            {item.listItems.map((listItem) => (
              <Link to={listItem.url} className="listItem" key={listItem.id}>
                <img src={listItem.icon} alt="" />
                <span className="listItemTitle">{listItem.title}</span>
              </Link>
            ))}
          </div>
        ))}
      </div>
    );
  };




  export default WareHouseMenu;