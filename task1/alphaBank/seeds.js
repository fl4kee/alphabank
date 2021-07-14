const mongoose = require('mongoose');
const Unit = require('./models/unit')
const data = require('./testdata.json');

mongoose.connect('mongodb://localhost:27017/alphaBankDB', {useNewUrlParser: true, useUnifiedTopology: true})
    .then(() => {
        console.log("CONNECTION OPEN!!!")
    })
    .catch(err => {
        console.log("OH NO ERROR!!!")
        console.log(err)
    })

Unit.insertMany(data)
.then(() => {
    console.log('Success')
})

