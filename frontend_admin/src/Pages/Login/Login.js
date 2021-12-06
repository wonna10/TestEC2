//Reference:https://github.com/mohanramphp/auth-using-react
import React, { useState, useEffect } from 'react';
import { makeStyles, Button } from '@material-ui/core';
import { useHistory } from "react-router-dom";
import axios from 'axios';
import Title from "../../Elements/Title/Title";
import config from '../../Config.js';
import { useForm } from "react-hook-form";
import { saveUserDataToLocalStore } from '../../Utils/Common.js';

//import Components
import colour from '../../Components/Colours/Colours'

function Login() {
  const { register, handleSubmit, errors } = useForm();
  const history = useHistory();

  //states
  const [errSpaceA, setErrSpaceA] = useState(54)
  const [errSpaceB, setErrSpaceB] = useState(54)

  //errSpace Change
  useEffect(() => {
    if (errors.email) {
      setErrSpaceA(30)
    } else {
      setErrSpaceA(54)
    }
    if (errors.password) {
      setErrSpaceB(30)
    } else {
      setErrSpaceB(54)
    }
  }, [errors.email, errors.password])

  //test data
  const testEmail = 'bobsong@gmail.com';
  const testPw = 'ezy123';

  //Styles
  const useStyles = makeStyles({
    //local style
    shadow: {
      boxShadow: "0px 5px 5px rgba(00,00,00,0.2)"
    },
    formContainer: {
      backgroundColor: colour.c3,
      color: colour.c1,
      borderRadius: "5px",
      boxShadow: "0px 5px 5px rgba(00,00,00,0.2)",
    },
    form: {
      width: '95%',
      margin: 'auto',
      color: 'white',
      padding: '20px'
    },
    errorMessage: {
      color: colour.error,
    },
    label: {
      fontSize: '1.2rem'
    }
  })
  const classes = useStyles()

  //Submit
  const onSubmit = (data) => {
    console.log(data)
    axios.post(`${config.baseUrl}/a/users/adminsignin`,
      { email: data.email, password: data.password }, {withCredentials:true})
      .then(response => {
        alert('Login success')
        saveUserDataToLocalStore(response.data.token, response.data.displayName, response.data.email);
        history.push('/dashboard');
      }).catch(error => {
        console.dir(error);
        if ((error.response != null) && (error.response.request.status === 401)) {
          alert('Email or password is wrong')
        } else if (error.message != null) {
          alert('Err')
        } else {
          alert('Something went wrong. Please try again later.');
        }
      });
  }

  return (
    <div>
      <Title title="Login"></Title>
      <div className={classes.shadow} style={{
        position: 'absolute',
        top: '50%',
        left: '50%',
        transform: 'translate(-50%, -50%)',
        width: '450px',
        backgroundColor: colour.c3,
        borderRadius: 15,
        color: colour.c1
      }}>
        <div style={{ backgroundColor: colour.c6, borderRadius: "15px 15px 0px 0px", width: "100%" }}>
          <h1 style={{ paddingTop: 10, paddingBottom: 10, textAlign: 'center' }}>Associates Consulting</h1>
        </div>
        <div>
          <form className={classes.form} onSubmit={handleSubmit(onSubmit)}>
            <div style={{ marginBottom: errSpaceA }}>
              <label htmlFor="email" className={classes.label}>Email</label>
              <input
                type="text"
                name="email"
                placeholder='Email'
                defaultValue={testEmail}
                className='form-control'
                ref={register({ required: { value: true } })}
              />
              {errors.email && <p className={classes.errorMessage}>Please input email</p>}
            </div>
            <div style={{ marginBottom: errSpaceB }}>
              <label htmlFor="password" className={classes.label}>Password</label>
              <input
                type="password"
                name="password"
                placeholder='Password'
                defaultValue={testPw}
                className='form-control'
                ref={register({ required: { value: true } })}
              />
              {errors.password && <p className={classes.errorMessage}>Please input password</p>}
            </div>
            <Button
              className={classes.shadow}
              type='submit'
              style={{
                backgroundColor: colour.c5,
                color: colour.c1,
                width: '100%',
                fontSize: '1.2rem'
              }}
            >Login</Button>
          </form>
        </div>
      </div>
    </div >
  );
}
export default Login;