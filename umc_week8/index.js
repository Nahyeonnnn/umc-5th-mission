import express from 'express';
import { tempRouter } from './src/routes/temp.route.js';
import { response } from './config/response.js';
import { status } from './config/response.status.js';
import { BaseError } from './config/error.js';

const app = express();
const port = 3000;

//temp router setting
app.use('/temp', tempRouter);

// app.use((err, req, res, next) => {
//     console.error(err.stack)
//     res.status(500).send(err.stack);
// });

app.use((req, res, next) => {
    const err = new BaseError(status.NOT_FOUND);
    next(err);
});

app.use((err, req, res, next) => {
    res.locals.message = err.message;   
    res.locals.error = process.env.NODE_ENV !== 'production' ? err : {}; 
    res.status(err.data.status).send(response(err.data));
});

app.listen(port, () => {
    console.log(`Example app listening on port ${port}`);
});