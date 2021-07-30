const mongoose = require('mongoose');

const UserSchema = mongoose.Schema({
    name: {
        type: String,
        require: true
    },
    lastDay: {
        type: String,
        require: true
    },
    howLong: {
        type: String,
        require: true
    },
    cycleLenght: {
        type: String,
        require: true
    },
    deviceId: {
        type: String,
        require: true
    },
});

module.exports = mongoose.model('users', UserSchema);