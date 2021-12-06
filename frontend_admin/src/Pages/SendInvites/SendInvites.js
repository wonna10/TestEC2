import React, { useState, useEffect } from 'react';
import { makeStyles } from '@material-ui/core';
import { useHistory } from 'react-router-dom';
import Select from 'react-select';
import axios from 'axios';
import config from '../../Config';
import Title from '../../Elements/Title/Title';
import { useForm, Controller } from 'react-hook-form';
import { Row } from 'react-bootstrap'

//import Components
import colour from '../../Components/Colours/Colours'
import TopBar from '../../Components/TopBar/TopBar'
import StyledButton from '../../Components/StyledButton/StyledButton'
import EmailChip from '../../Components/EmailChip/EmailChip';

const SendInvites = () => {
  const { register, handleSubmit, errors, control } = useForm();
  const history = useHistory();

  //states
  const [company, setCompany] = useState();
  const [companiesIdOptions, setCompaniesIdOptions] = useState([]);
  const [emailValid, setEmailValid] = useState('')
  const [companyValid, setCompanyValid] = useState()
  const [email, setEmail] = useState({
    items: [],
    value: "",
    error: null
  })


  //Styles
  const useStyles = makeStyles({
    //local style
    formContainer: {
      backgroundColor: colour.c3,
      color: colour.c1,
      borderRadius: "5px",
      boxShadow: "0px 5px 5px rgba(00,00,00,0.2)",
    },
    form: {
      width: '80%',
      margin: 'auto',
      color: 'white',
      padding: '20px'
    },
    formField: {
      marginBottom: 30,
    },
    btnContainer: {
      marginTop: 20,
      marginBottom: 20,
      margin: 'auto'
    },
    errorMessage: {
      color: colour.error
    }
  })
  const classes = useStyles()

  const selectStyle = {
    option: styles => ({ ...styles, color: 'black' }),
  }

  useEffect(() => {
    axios.get(`${config.baseUrl}/a/company/getallcompanies`,
      {})
      .then(response => {
        const companiesData = response.data.map(oneData => ({ value: oneData.company_id, label: oneData.name }));
        setCompaniesIdOptions(companiesIdOptions.concat(companiesData));

      }).catch(error => {
        console.log(error);
      });
  }, []);

  // Handle the form submit of Registration form
  const onSubmit = (data) => {
    //check if selected
    if (data.company == undefined) {
      setCompanyValid(true)
      return
    } else {
      setCompanyValid(false)
    }

    if (email.items.length == 0) {
      setEmailValid('empty')
      return
    } else {
      setEmailValid('valid')
    }

    data = { ...data, email: email.items }

    axios.post(`${config.baseUrl}/a/user/sendsuperadmininvite`,
      data)
      .then(response => {
        alert('Invite has been sent')
        history.push(`/dashboard`);
      }).catch(error => {
        console.log(error)
        if (error.response.status == 500) {
        }
        if (error.response.status == 401) {
          let string = ''
          for (let i = 0; i < error.response.data.length; i++) {
            string += '\n' + error.response.data[i]
          }
          alert(`These these email(s) ${string}\nhas already been registered or already exist in the invite list.`)
        }
      });


  }// End of onSubmit

  return (
    <div>
      <TopBar pageName="Send Invites" />
      <Title title="Send Invites"></Title>
      <div className={classes.formContainer}>
        <form className={classes.form} onSubmit={handleSubmit(onSubmit)}>
          <div className="form-group">
            <label htmlFor="companiesIdInput">Company</label>
            <Controller
              as={Select}
              control={control}
              placeholder={'Select a company...'}
              name="company"
              options={companiesIdOptions}
              value={company}
              onChange={setCompany}
              styles={selectStyle}
              ref={register}
            />
            {companyValid && <p className={classes.errorMessage}>Please select a company</p>}
          </div>
          <div className="form-group">
            <label htmlFor="emailInput">Emails</label>
            <EmailChip email={email} setEmail={setEmail} />
            {emailValid == 'empty' && <p className={classes.errorMessage}>Please insert at least one email.</p>}
          </div>
          <Row>
            <div style={{margin:'auto'}}>
              <StyledButton text="Submit" type='submit' event={() => { }} />
              <StyledButton text="Cancel" event={() => { history.push('/manageinvites') }} style={{ marginLeft: 20 }} />
            </div>
          </Row>
        </form>
      </div>
    </div>
  )
};

export default SendInvites;