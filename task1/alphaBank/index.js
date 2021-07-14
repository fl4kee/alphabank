const express = require('express')
const mongoose = require('mongoose')
const path = require('path')
const Unit = require('./models/unit.js')

const app = express()

app.use(express.static(path.join(__dirname, '/public')))
app.set('views', path.join(__dirname, '/views'))
app.set('view engine', 'ejs')
app.set('')

mongoose.connect('mongodb://localhost:27017/alphaBankDB', {useNewUrlParser: true, useUnifiedTopology: true})
    .then(() => {
        console.log("Connection to MongoDB is open")
    })
    .catch(err => {
        console.log("Error. No connection to database")
        console.log(err)
    })


    
app.get('/', async (req, res) =>{
    try{
        const allUnits = await Unit.find({}).sort({experience: -1}).sort({coins: -1})
        res.render('home', {allUnits})
    }
    catch(e){
        console.log('Check connection with database.', e)
    }
})

app.listen(3000, () => console.log("App is running"))