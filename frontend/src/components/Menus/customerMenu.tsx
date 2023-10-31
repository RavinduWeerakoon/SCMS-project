import NewMenu from "./newMenu";

interface Content {
    name: string;
    link: string;
    icon: string;
}

const contentList: Content[] = [
    {
        name: "Dashboard",
        link: "/",
        icon: "bi-speedometer2",
    },
    {
        name: "Orders",
        link: "/orders",
        icon: "bi-cart4",
    },
    {
        name: "Inventory",
        link: "/inventory",
        icon: "bi-archive",
    },
    {
        name: "Settings",
        link: "/settings",
        icon: "bi-gear",
    },
    {
        name: "Logout",
        link: "/logout",
        icon: "bi-box-arrow-right",
    },
];

const CustomerMenu = () => {
    return <NewMenu contentList={contentList} />;
};

export default CustomerMenu;
