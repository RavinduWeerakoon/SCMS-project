
import React from 'react';


interface Content {
  name: string;
  link: string;
  icon: string;
}

interface NewMenuProps {
  contentList: Content[];
}

const NewMenu: React.FC<NewMenuProps> = ( props) => {
  return (
    <div className="d-flex flex-column flex-shrink-0 p-3 bg-light" style={{width: "280px;"}}>
      <a href="/" className="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
        <svg className="bi me-2" width="40" height="32"><use xlinkHref="#bootstrap"></use></svg>
        <span className="fs-4">Dashboard</span>
      </a>
      <hr/>
      <ul className="nav nav-pills flex-column mb-auto">
        {props.contentList.map((content, index) => (
          <li key={index} className="nav-item">
            <a href={content.link} className="nav-link link-dark">
              <i className={`bi ${content.icon} me-2`}></i>
              {content.name}
            </a>
          </li>
        ))}
      </ul>
      <hr/>
    </div>
  );
};

export default NewMenu;

