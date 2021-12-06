import React, { } from 'react';
import { makeStyles, Typography } from '@material-ui/core';
import colour from '../../Components/Colours/Colours'

const useStyles = makeStyles({
    missing: {
        color: colour.c1
    }
})


const MissingPage = () => {
    const classes = useStyles()

    return (
        <Typography className={classes.missing} variant="h1">404 Page Not Found</Typography>
    );
};

export default MissingPage;