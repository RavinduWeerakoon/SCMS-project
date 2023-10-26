import BarChartBox from "../../components/barChartBox/BarChartBox";
import BigChartBox from "../../components/bigChartBox/BigChartBox";
import ChartBox from "../../components/chartBox/ChartBox";
import PieChartBox from "../../components/pieCartBox/PieChartBox";
import TopBox from "../../components/topBox/TopBox";
import DisplayOrders from "../../components/displayOrders/displayOrders";
import TrainSchedule from "../../components/trainSchedule/trainSchedule";
import {
  barChartBoxRevenue,
  barChartBoxVisit,
  chartBoxConversion,
  chartBoxProduct,
  chartBoxRevenue,
  chartBoxUser,
} from "../../data";
import "./home.scss";

const Home = () => {
  return (
    <div className="home">
      <div className="box boxn">
        <h3>This is the dashboard</h3>
      </div>
      <div className="box box7">
        {/* <TopBox /> */}
        <DisplayOrders />
      </div>

      <div className="box box7">
        {/* <TopBox /> */}
        <TrainSchedule />
      </div>

    </div>
  );
};

export default Home;
