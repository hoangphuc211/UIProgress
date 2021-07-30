const express = require('express');

const app = express();

const mongoose = require('mongoose');

const bodyParser = require('body-parser');

const cors = require('cors');

require('dotenv').config();

// IMPORT ROUTES
const postUser = require('./routes/user.js');

// MIDDLEWARE
app.use(cors());
app.use(bodyParser.json());

app.use('/users', postUser);

// ROUTES
app.get('/', (req, res) => {
    res.send('WELCOME TO API MOON SERVER');
});

// PORT
const PORT = 3000;

// DB
mongoose.connect(
    process.env.DB_CONNECTION,
    { userNewUrlParser: true },
    () => console.log('Connected to DB!')
);
// LISTENER
app.listen(PORT);