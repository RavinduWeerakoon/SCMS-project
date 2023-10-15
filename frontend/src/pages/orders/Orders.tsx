import { useEffect, useState } from "react";
import "./Orders.scss";
import DataTable from "../../components/dataTable/DataTable";
import Add from "../../components/add/Add";
import { GridColDef } from "@mui/x-data-grid";
//import { products } from "../../data";

const columns: GridColDef[] = [
  { field: "ID", headerName: "ID"},
  {
    field: "img",
    headerName: "Image",
    renderCell: (params) => {
      return <img src={params.row.img || "/noavatar.png"} alt="" />;
    },
  },
  {
    field: "name",
    type: "string",
    headerName: "Product Name",
  },
  {
    field: "type",
    type: "string",
    headerName: "type",
  },
  {
    field: "unit_capacity",
    type: "string",
    headerName: "Unit Capacity"
  },
  {
    field: "unit_price",
    headerName: "Unit Price",
    type: "string",
  },
  // {
  //   field: "createdAt",
  //   headerName: "Created At",
  //   width: 200,
  //   type: "string",
  // },
  {
    field: "inStock",
    headerName: "In Stock",
    type: "boolean",
  },
];

const Products = () => {
  const [open, setOpen] = useState(false);
  const [products, setProducts] = useState([]);

  useEffect(() => {
    const fetchProducts = async () => {
      const response = await fetch("http://localhost:5000/customer/products");
      const data = await response.json();
      setProducts(data);
    };

    fetchProducts();
  }, []);



  // TEST THE API

  // const { isLoading, data } = useQuery({
  //   queryKey: ["allproducts"],
  //   queryFn: () =>
  //     fetch("http://localhost:8800/api/products").then(
  //       (res) => res.json()
  //     ),
  // });

  return (
    <div className="products">
      <div className="info">
        <h1>Products</h1>
        <button onClick={() => setOpen(true)}>Add New Products</button>
      </div>
      <DataTable slug="products" columns={columns} rows={products} />
      {/* TEST THE API */}

      {/* {isLoading ? (
        "Loading..."
      ) : (
        <DataTable slug="products" columns={columns} rows={data} />
      )} */}
      {open && <Add slug="product" columns={columns} setOpen={setOpen} />}
    </div>
  );
};

export default Products;
