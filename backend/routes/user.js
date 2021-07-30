const express = require('express');

const router = express.Router();

const User = require('../models/user.js');

// --- GET ALL ----
router.get('/', async (req, res) => {
    try {
        const users = await User.find();
        res.json(users);
    } catch (err) {
        res.json({ message: err });
    }
});

// --- CREATE NEW USER ---
router.post('/', async (req, res) => {
    const user = new User({
        name: req.body.name,
        deviceId: req.body.deviceId,
        lastDay: req.body.lastDay,
        howLong: req.body.howLong,
        cycleLenght: req.body.cycleLenght
    });
    try {
        const CreateUser = await user.save();
        res.json(CreateUser);
    } catch (err) {
        res.json({ message: err })
    }
});

// --- GET USER BY ID ---
router.get('/:_id', async (req, res) => {
    try {
        const GetUserById = await User.findById(req.params._id);
        res.json(GetUserById);
    } catch (err) {
        res.json({ message: err });
    }
});

// --- DELETE USER BY ID ---
router.delete('/:_id', async (req, res) => {
    try {
        const RemoveUser = await User.remove({ _id: req.params._id });
        res.json(RemoveUser);
    } catch (err) {
        res.json({ message: err });
    }
})


// --- UPDATE USER BY ID ---
router.patch('/:_id', async (req, res) => {
    try {
        const updatedUser = await User.updateOne(
            { _id: req.params._id },
            { $set: { name: req.body.name } }
        );
        res.json(updatedUser)
    } catch (err) {
        res.json({ message: err });
    }
})
module.exports = router;