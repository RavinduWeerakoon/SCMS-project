import NewMenu from "./newMenu";

interface Content {
    name: string;
    link: string;
    icon: string;
}

const contentList: Content[] = [
    {
        name: "Admin",
        link: "/admin",
        icon: "bi-speedometer2",
    },
    {
        name: "Products",
        link: "/admin/products",
        icon: "bi-cart4",
    },
    {
        name: "Sales Report",
        link: "/admin/sales-report",
        icon: "bi-cash",
    },
    {
        name: "Assistant Hours",
        link: "/admin/assistant",
        icon: "bi-clock",
    },
    {
        name: "Driver Hours",
        link: "/admin/driver",
        icon: "bi-clock",
    },

    {
        name:"Trck Info",
        link: "/admin/truck",
        icon : "bi-truck"
    },

    {
        name:"User-details",
        link:"/admin/user-details",
        icon:"bi-person"

    }
];

const AdminMenu = () => {
    return <NewMenu contentList={contentList} />;
};

export default AdminMenu;