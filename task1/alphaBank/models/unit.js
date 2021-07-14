const mongoose = require('mongoose')

const unitSchema = new mongoose.Schema({
    idNode: Number,
    fio: String,
    sex: String,
    idParent: Number,
    idRole: Number,
    idZone: Number,
    idInstance: Number,
    level: String,
    levelOrder: Number,
    resources: String,
    experience: {
        type: Number,
        default: function(){
            sum = 0
            for(let resource of JSON.parse(this.resources)){
                sum += resource.value
            }
            return `${sum}`
        }
    },
    coins: {
        type: Number,
        default: function(){
            return JSON.parse(this.resources).find(r => r.resource === 'MONEY').value
        }
    }
})   

     
const Unit = mongoose.model('Unit', unitSchema)

module.exports = Unit