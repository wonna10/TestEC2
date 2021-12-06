import React, { Component, useState, useEffect } from 'react';
//https://code.tutsplus.com/tutorials/working-with-tables-in-react-part-one--cms-29682
//react-bootstrap-table-next is actually, 
//react-bootstrap-table2 - is the new version 2, do not get confused
//thinking that it is the old now
import { Button, Row, Col } from 'react-bootstrap';
import { useForm } from 'react-hook-form';
import axios from 'axios';
import Title from "../../Elements/Title/Title";
import config from '../../Config.js';
import { useHistory } from 'react-router-dom';
import MaterialTable from 'material-table'
import tableIcons from '../../Components/MUITableIcons/material.table.icons'
import { Paper, makeStyles } from '@material-ui/core';


//The following library is for creating notification alerts when user 
//clicks the save button.
import { ToastContainer, toast } from 'react-toastify';
//Reference: https://fkhadra.github.io/react-toastify/introduction/

//Components
import TopBar from '../../Components/TopBar/TopBar'
import StyledButton from '../../Components/StyledButton/StyledButton'
import colour from '../../Components/Colours/Colours'
import ModalPopup from '../../Components/ModalPopup/ModalPopup';

//style
const useStyles = makeStyles({
	//local style
	table: {
		boxShadow: "0px 5px 5px rgba(00,00,00,0.2)",
		"& > *": {
			backgroundColor: colour.c3,
			color: colour.c1 + '!important'
		},
		"& th > span": { color: colour.c1 + '!important' },
		// "& svg": { color: colour.c1 + '!important' },
		"& svg": { fill: colour.c1 },
		"& div": { color: colour.c1, borderBottom: colour.c1 + '!important' },
		"& td ": { color: colour.c1 }
	},
	boxContainer: {
		"& > button": {
			marginRight: 10,
			marginBottom: 5,
			marginTop: 5,
		}
	}
})


const ManageCompanies = () => {
	const [companyData, setCompanyData] = useState();
	const history = useHistory()
	const classes = useStyles()


	useEffect(() => {
		axios.get(`${config.baseUrl}/a/company/getallcompanies`,
			{})
			.then(response => {
				setCompanyData(response.data)
			}).catch(error => {
				console.log(error);
			});
	}, []);//End of useEffect({function code,[]})



	const columns = () => [
		{
			title: "company_id",
			field: "company_id",
			hidden: true,
		},
		{
			title: "Name",
			field: "name",
		},
		{
			title: "Email",
			field: "email",
		},
		{
			title: "Contact Number",
			field: "contact_number",
		},
		{
			title: "Status",
			field: "status",
			lookup: { 0: "Terminated", 1: "Active" }
		},
		{
			title: "Action",
			cellStyle: {
				width: "25%"
			},
			render: rowData =>
				<div className={classes.boxContainer}>
					<ModalPopup rowData={rowData} Data={companyData} setData={setCompanyData} />
				</div>
		},

	];
	return (
		<div>
			<TopBar pageName="Manage Companies" />
			<Title title="Manage Companies"></Title>
			<Paper className={classes.table}>
				<MaterialTable
					icons={tableIcons}
					columns={columns()}
					data={companyData}
					title="Manage Companies"
					options={{
						tableLayout: "auto",
						draggable: false,
						headerStyle: {
							backgroundColor: colour.c3,
							borderTop: 'solid',
							borderBottom: 'solid',
							borderWidth: 2,
							color: colour.c1
						},
						rowStyle: {
							borderColor: '#ff0000'
						}
					}}

				/>
				<Row style={{ margin: 'auto' }}>
					<Col>
						<div className={classes.btnContainer}>
							<StyledButton style={{ marginTop: 10, marginBottom: 10 }} text="Create Company" event={() => history.push('/createcompany')}></StyledButton>
						</div>
					</Col>
				</Row>
			</Paper>
		</div>
	);
};

export default ManageCompanies;