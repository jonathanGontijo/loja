//Imports From Packages
const express = require('express');
const mongoose = require('mongoose');

//Imports From Files
const authRouter = require('./routes/auth');
const adminRouter = require('./routes/admin');
//const productRouter = require("./routes/product");

//INIT
const PORT = 3000;
const app = express();
const DB = "mongodb+srv://jonathan:fataMorgana@cluster0.x2cj4oj.mongodb.net/?appName=Cluster0";

// midleware
app.use(express.json());
app.use(authRouter);
app.use(adminRouter);
//app.use(productRouter);

//Database Connection
mongoose.connect(DB).then(() => {
    console.log('Database connected');
}).catch((e) => {
    console.log('Database connection error:', e);
});


app.listen(PORT, "0.0.0.0", () => {
    console.log(`Server is running on port ${PORT}`);
});
