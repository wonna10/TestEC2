import Chart from "react-google-charts";
import colour from "../Colours/Colours";
import { Paper, makeStyles } from "@material-ui/core";
const useStyles = makeStyles({
    //local style
    container: {
        width: "49%",
        borderRadius: 5,
        boxShadow: "0px 5px 5px rgba(00,00,00,0.2)",
        padding: 5,
        backgroundColor: colour.c3
    },
    title: {
        padding: 10,
        color: 'white',
        margin: 'auto'
    },
    chart: {
        margin: 'auto'
    }
})

const StatsChart = ({ Title, Data }) => {
    const classes = useStyles()
    return (
        <Paper className={classes.container}>
            <Chart className={classes.chart}
                width='100%'
                height='450px'
                chartType="PieChart"
                loader={<div>Loading Chart</div>}
                data={[
                    ['Companies', 'Status'],
                    ['Active', Data.activeCount],
                    ['Terminated', Data.terminatedCount],
                ]}
                options={{
                    title: Title,
                    titleTextStyle: {
                        color: 'white',
                        fontSize: 25,
                        bold: true,
                        italic: false,
                    },
                    pieHole: 0.6,
                    legend: {
                        position: "bottom",
                        alignment: "center",
                        textStyle: {
                            color: "white",
                            fontSize: 14
                        }
                    },
                    slices: [
                        {
                            color: "#2BB673"
                        },
                        {
                            color: "#d91e48"
                        }],
                    tooltip: {
                        showColorCode: true,
                        ignoreBounds: true
                    },
                    backgroundColor: colour.c3
                }}
                style={{ borderRadius: 5 }}
                legend_toggle
            />
        </Paper>
    )
}

export default StatsChart