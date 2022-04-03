const express = require('express');
// const rateLimit = require("rate-limit");
const helmet = require('helmet');
const compression = require('compression');
const morgan = require('morgan');
// Controllers
const { globalErrorHandler } = require('./controllers/error.controller');

// Routers
const { usersRouter } = require('./routes/users.route');
const { productsRouter } = require('./routes/products.route');
const { cartRouter } = require('./routes/cart.routes');

const app = express();

// Enable incoming JSON data
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

//ddos rate limit
// app.use(
//   rateLimit({
//     WindowMs: 60 * 60 * 1000,
//     max: 1000,
//     message: 'Too many request from your IP, try after 1 hour'
//   })
// );
//add headers security
app.use(helmet());

//compresion
app.use(compression());

app.use(morgan('dev'));

// Endpoints
app.use('/api/v1/users', usersRouter);
app.use('/api/v1/products', productsRouter);
app.use('/api/v1/cart', cartRouter);

app.use(globalErrorHandler);

module.exports = { app };
