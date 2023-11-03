import NewMenu from "./newMenu";

interface Content {
    name: string;
    link: string;
    icon: string;
  }


const contentList: Content[] = [
    {
        name: "Dashboard",
        link: "/tmanager",
        icon: "bi-speedometer2",
    },
    {
        name: "Add Schedule",
        link: "/tmanager/add-schedule",
        icon: "bi-train-front",
    },
  
];

const TrainManagerMenu = () => {

    return(
        <NewMenu contentList={contentList} />
    )
}


export default TrainManagerMenu;