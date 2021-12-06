import React from 'react';
import {
    Route,
    BrowserRouter as Router,
    Switch,
    Redirect,
} from 'react-router-dom';

//style
import { createMuiTheme } from '@material-ui/core/styles';
import { ThemeProvider } from '@material-ui/styles';

//pages
import Login from './Pages/Login/Login';
import Dashboard from './Pages/Dashboard/Dashboard';
import ManageCompanies from './Pages/ManageCompanies/ManageCompanies';
import CreateCompany from './Pages/CreateCompany/CreateCompany';
import SendInvites from './Pages/SendInvites/SendInvites';
import ManageInvites from './Pages/ManageInvites/ManageInvites';
import MissingPage from './Pages/MissingPage/MissingPage';
// import User from './Pages/User/User';
// import FileManagement from './Pages/FileManagement/FileManagement';
// import SetDeadline from './Pages/SetDeadline/SetDeadline';

//components
import SideNav from './Components/SideNav/SideNav'
import { colors } from '@material-ui/core';
import colour from './Components/Colours/Colours';

//css
import './style.css'

const authGuard = (Component) => () => {
    return localStorage.getItem('token') ? (
        <Component />
    ) : (
        <Redirect to='/login' />
    );
};

const themeMUI = createMuiTheme({
    typography: {
        fontFamily: [
            'Segoe UI', 'Frutiger', 'Frutiger Linotype', 'Dejavu Sans', 'Helvetica Neue', 'Arial', 'sans-serif'
        ]
    },
    palette: {
        background: {
            default: colour.c4
        }
    }
})


const Routes = (props) => (
    <ThemeProvider theme={themeMUI}>
        <Router {...props}>
            <Switch>
                <Route exact strict path="/login" component={Login} />
                <Route path=''>
                    <div style={{ display: 'flex', height: '100vh' }}>
                        <SideNav />
                        <div style={{ width: '100%', margin: 10 }}>
                            {/* <TopBar pageName='' /> */}
                            <Switch>
                                {/* add pages as shown bellow
                                <Route path="/pathname" component={authGuard(page)}></Route> */}
                                <Route path="/dashboard" component={authGuard(Dashboard)}></Route>
                                <Route path="/managecompanies" component={authGuard(ManageCompanies)} />
                                <Route path="/createcompany" component={authGuard(CreateCompany)} />
                                <Route path="/sendinvites" component={authGuard(SendInvites)} />
                                <Route path="/manageinvites" component={authGuard(ManageInvites)} />
                                <Route exact path="/">
                                    <Redirect to="/dashboard" />
                                </Route>
                                <Route path="" component={MissingPage} />
                            </Switch>
                        </div>
                    </div>
                </Route>
            </Switch>
        </Router >
    </ThemeProvider>
);

export default Routes;
