var express = require('express');
var router = express.Router();
var dbconnection = require('../lib/db');
var Student = require('../models/students')
var Trainer = require('../models/trainers')


router.get('/', function(req, res, next) {
  res.render('index', { title: 'Private School' });
});

module.exports = router;
