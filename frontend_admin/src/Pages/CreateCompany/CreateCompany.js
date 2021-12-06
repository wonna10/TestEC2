import React, { useState, useMemo } from 'react';
import { makeStyles } from '@material-ui/core';
import { useHistory } from 'react-router-dom';
import countryList from 'react-select-country-list'
import Select from 'react-select';
import axios from 'axios';
import config from '../../Config';
import Title from '../../Elements/Title/Title';
import PhoneInput from 'react-phone-input-2'
import { decodeToken } from "react-jwt";
import 'react-phone-input-2/lib/style.css'
import { useForm, Controller } from 'react-hook-form';
import {Row} from 'react-bootstrap'

//import Components
import colour from '../../Components/Colours/Colours'
import TopBar from '../../Components/TopBar/TopBar'
import StyledButton from '../../Components/StyledButton/StyledButton'



const CreateCompany = () => {
  const { register, handleSubmit, control, errors } = useForm()

  const history = useHistory();
  const countryOptions = useMemo(() => countryList().getData(), [])
  const token = localStorage.getItem('token')
  const user_id = decodeToken(token).userId

  //States
  const [contact, setContact] = useState('')
  const [contactValid, setContactValid] = useState('')
  const [country, setCountry] = useState('')

  //regex
  const regex = new RegExp(/65[6|8|9]\d{7}/g)

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

  //Select Style
  const selectStyle = {
    option: styles => ({ ...styles, color: 'black' })
  }

  //Handle the form submit of Registration form
  const onSubmit = (data) => {

    //validate contact
    console.log(data.contact)
    if (data.contact == '') {
      console.log('empty')
      setContactValid('empty')
      return
    } else if (regex.test(data.contact) == true) {
      console.log('pass')
      setContactValid('pass')
    } else {
      console.log('fail')
      setContactValid('fail')
      return
    }

    axios.post(`${config.baseUrl}/a/company/createcompany/${user_id}`,
      {data}
      )
      .then(response => {
        alert('Submit Ok')
        alert('Successfully Created')
        history.push(`/dashboard`);
      }).catch(error => {
        console.log(error)
        alert('Error when submitting, please try again.')
      });
  }// End of onSubmit
  https://stackoverflow.com/questions/62574713/react-form-hooks-how-to-validate-select-option

  return (
    <div>
      <TopBar pageName="Create Company" />
      <Title title="Create Company"></Title>
      <div className={classes.formContainer} >
        <form className={classes.form} onSubmit={handleSubmit(onSubmit)}>
          <div className={classes.formField}>
            <label htmlFor="name">Company Name</label>
            <input
              name="name"
              type='text'
              className="form-control"
              placeholder="Enter Name"
              ref={register({ required: { value: true, message: "Please input company name" } })}
            />
            {errors.name && <p className={classes.errorMessage}>{errors.name.message}</p>}
          </div>

          <div className={classes.formField}>
            <label htmlFor="description">Company Description</label>
            <input
              name="description"
              className="form-control"
              type='text'
              placeholder="Enter Name"
              ref={register({ required: { value: true, message: "Please input company name" } })}
            />
            {errors.description && <p className={classes.errorMessage}>{errors.description.message}</p>}
          </div>

          <div className={classes.formField}>
            <label htmlFor="email">Company Email</label>
            <input
              name="email"
              className="form-control"
              type='email'
              placeholder="Enter Email"
              ref={register({ required: { value: true, message: "Please input company name" } })}
            />
            {errors.email && <p className={classes.errorMessage}>{errors.email.message}</p>}
          </div>

          <div className={classes.formField}>
            <label htmlFor="contact">Company Contact Number</label>
            <Controller
              as={PhoneInput}
              control={control}
              defaultValue={''}
              name='contact'
              inputProps={{
                placeholder: "Enter contact number",
              }}
              name="contact"
              country="sg"
              value={contact}
              onChange={setContact}
              ref={register({ required: { value: true }, pattern: /65(6|8|9)\d{7}/g })}
            />
            {contactValid == 'empty' && <p className={classes.errorMessage}>Please input company contact number</p>}
            {contactValid == 'fail' && <p className={classes.errorMessage}>Company contact number invalid</p>}
          </div>

          <div className={classes.formField}>
            <label htmlFor="country">Select Country</label>
            <Controller
              as={Select}
              control={control}
              defaultValue={{ value: "SG", label: "Singapore" }}
              name='country'
              options={countryOptions}
              styles={selectStyle}
              value={country}
              onChange={setCountry}
              ref={register({ required: { value: true, message: "Please select a country" } })}
            />
            {errors.country && <p className={classes.errorMessage}>{errors.country.message}</p>}
          </div>

          <div className={classes.formField}>
            <label htmlFor="state">State</label>
            <input
              name="state"
              type='text'
              className="form-control"
              placeholder="Enter Name"
              ref={register({ required: { value: true, message: "Please input company's state" } })}
            />
            {errors.state && <p className={classes.errorMessage}>{errors.state.message}</p>}
          </div>

          <div className={classes.formField}>
            <label htmlFor="street">Street</label>
            <input
              name="street"
              type="text"
              className="form-control"
              placeholder="Enter Name"
              ref={register({ required: { value: true, message: "Please input company's street" } })}
            />
            {errors.street && <p className={classes.errorMessage}>{errors.street.message}</p>}
          </div>

          <div className={classes.formField}>
            <label htmlFor="postalcode">Postal Code</label>
            <input
              name="postalcode"
              type="number"
              className="form-control"
              placeholder="Enter Name"
              ref={register({ required: { value: true, message: "Please input company's postal" } })}
            />
            {errors.postalcode && <p className={classes.errorMessage}>{errors.postalcode.message}</p>}
          </div>
          <Row>
            <div style={{margin:'auto'}}>
            <StyledButton text="Submit" type='submit' event={() => { }} />
            <StyledButton text="Cancel" event={() => { history.push('/dashboard') }} style={{ marginLeft: 20 }} />
            </div>
          </Row>
        </form>
      </div>
    </div>
  );
};

export default CreateCompany;