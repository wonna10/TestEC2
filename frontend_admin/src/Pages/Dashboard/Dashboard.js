//import Components
import colour from '../../Components/Colours/Colours'
import Title from "../../Elements/Title/Title";
import TopBar from '../../Components/TopBar/TopBar'
import StyledButton from '../../Components/StyledButton/StyledButton'
import StatsChart from "../../Components/StatsChart/StatsChart";
import { Paper, makeStyles } from "@material-ui/core";
import axios from "axios";
import config from "../../Config";
import { useEffect, useState } from "react";

const useStyles = makeStyles({
  //local style
  root: {
    overflow: 'hidden',
    width: "100%"
  },
  charts: {
    width: '100%',
    display: 'flex',
    justifyContent: 'space-between'
  }
})

const Dashboard = () => {
  const classes = useStyles()
  const [companiesData, setCompaniesData] = useState({
    activeCount: 0,
    terminatedCount: 0,
  })
  const [usersData, setUsersData] = useState({
    activeCount: 0,
    terminatedCount: 0,
  })

  useEffect(() => {
    axios.get(`${config.baseUrl}/a/company/getcompaniesstats`,
      {})
      .then(response => {
        var data = response.data[0]
        setCompaniesData({
          activeCount: data.activeCount,
          terminatedCount: data.terminatedCount,
        });
      }).catch(error => {
        console.log(error);
      })

    axios.get(`${config.baseUrl}/a/user/getusersstats`,
      {})
      .then(response => {
        var data = response.data[0]
        setUsersData({
          activeCount: data.activeCount,
          terminatedCount: data.terminatedCount,
        });
      }).catch(error => {
        console.log(error);
      })
  }, [])

  return (
    <div className={classes.root}>
      <TopBar pageName="EiSo Consultant Platform" />
      <Title title="EiSo Consultant Platform"></Title>

      <div className={classes.charts}>
        <StatsChart Title='No. of Companies' Data={companiesData} />
        <StatsChart Title='No. of Users' Data={usersData} />
      </div>

    </div>
  );
};

export default Dashboard;
