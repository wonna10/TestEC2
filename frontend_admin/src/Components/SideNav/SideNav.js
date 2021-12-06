import React, { useState } from 'react';
import { Drawer, makeStyles, IconButton, Typography, ClickAwayListener } from '@material-ui/core';
import { Menu, ExitToApp, Business, Email, Dashboard, PersonAdd } from '@material-ui/icons'
import colour from '../Colours/Colours'
import { useHistory } from 'react-router';
import { Link } from 'react-router-dom';;

//admin sidenav

const SideNav = () => {
    //set drawer size and toggle 
    const history = useHistory();
    const closeWidth = 60
    const openWidth = 240
    const [drawerWidth, setDrawerWidth] = useState(closeWidth)
    const [drawerOpen, setDrawerOpen] = useState(false)

    const useStyles = makeStyles({
        //local style
        drawer: {
            width: drawerWidth
        },
        drawerPaper: {
            //some MUI thing i dont really know how it works
            width: drawerWidth,
            backgroundColor: colour.c5,
            borderRight: 0
            // for some reason anchor left gives a 1px border to the right. why does this exist i dont know but it is there
        },
        menuRow: {
            //each row of naviagtion
            color: colour.c1,
            display: 'flex',
            "&:hover": {
                backgroundColor: colour.c2,
                textDecoration: 'underline'
            }
        },
        iconStyle: {
            //icon
            color: colour.c1,
            fontSize: 40,
        },
        textStyle: {
            //text
            marginTop: 'auto',
            marginBottom: 'auto',
            paddingLeft: 5,
            color: 'white',
            fontSize: '1.5rem',
            fontWeight: 400,
            "&:hover": {
                border: "none",
                outline: "none",
                color: 'white'
            }
        },
        iconBtnStyle: {
            width: closeWidth,
            height: closeWidth,
            "&:focus": {
                border: "none",
                outline: "none"
            }
        },
        expandBtnStyle: {
            margin: 'auto',
        }
    })
    const classes = useStyles()

    const toggleDrawer = () => {
        //toggle from icon to icon with text for drawer or somethihng
        if (drawerOpen) {
            setDrawerOpen(false)
            setDrawerWidth(closeWidth)
        }
        else {
            setDrawerOpen(true)
            setDrawerWidth(openWidth)
        }
    }

    const closeDrawer = () => {
        setDrawerOpen(false)
        setDrawerWidth(closeWidth)
    }

    const logout = () => {
        var confirm = window.confirm("Logout?")
        if (confirm) {
            localStorage.clear();
            alert('You have been logged out <3')
            history.push("/login");
        }
    }

    return (
        <ClickAwayListener onClickAway={closeDrawer}>

            <Drawer open
                className={classes.drawer}
                variant='persistent'
                anchor='left'
                classes={{ paper: classes.drawerPaper }}
            >
                <div className={classes.menuRow}>
                    <IconButton onClick={() => toggleDrawer()} className={classes.iconBtnStyle}>
                        <Menu className={classes.iconStyle} />
                    </IconButton>
                    {drawerOpen && <Typography variant="h5" className={classes.textStyle}>Menu</Typography>}
                </div>
                <div className={classes.menuRow}>
                    <IconButton onClick={() => history.push('/dashboard')} className={classes.iconBtnStyle}>
                        <Dashboard className={classes.iconStyle} />
                    </IconButton>
                    {drawerOpen && <Link to="/dashboard" className={classes.textStyle}><h5>Dashboard</h5></Link>}
                </div>

                <div className={classes.menuRow}>
                    <IconButton onClick={() => history.push('/managecompanies')} className={classes.iconBtnStyle}>
                        <Business className={classes.iconStyle} />
                    </IconButton>
                    {drawerOpen && <Link to="/managecompanies" className={classes.textStyle}><h5>Manage Companies</h5></Link>}
                </div>

                <div className={classes.menuRow}>
                    <IconButton onClick={() => history.push('/manageinvites')} className={classes.iconBtnStyle}>
                        <Email className={classes.iconStyle} />
                    </IconButton>
                    {drawerOpen && <Link to="/manageinvites" className={classes.textStyle}><h5>Manage Invites</h5></Link>}
                </div>
                <div className={classes.menuRow}>
                    <IconButton onClick={() => logout()} className={classes.iconBtnStyle}>
                        <ExitToApp className={classes.iconStyle} />
                    </IconButton>
                    {drawerOpen && <Link to="" onClick={() => logout()} className={classes.textStyle}><h5>Logout</h5></Link>}
                </div>
            </Drawer >
        </ClickAwayListener>
    )
}

export default SideNav