var express = require('express');
var router = express.Router();
var dbconnection = require('../lib/db');

router.get('/',function(req,res, next){
    const query = "SELECT * FROM course";
    dbconnection.query(query, function(err,rows){
        if(err) {
            res.render('course',{title:'course',course:''})
        } else {
            res.render('course',{title:'course',course:rows})
        }
    });
  });

  module.exports = router;