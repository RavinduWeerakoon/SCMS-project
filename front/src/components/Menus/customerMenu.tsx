import NewMenu from "./newMenu";

interface Content {
    name: string;
    link: string;
    icon: string;
}

const contentList: Content[] = [
    {
        name: "Dashboard",
        link: "/customer",
        icon: "bi-speedometer2",
    },
    {
        name: "Orders",
        link: "customer/orders",
        icon: "bi-cart4",
    },
   
    
];

const CustomerMenu = () => {
    return <NewMenu contentList={contentList} />;
};

export default CustomerMenu;
