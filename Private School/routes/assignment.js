var express = require('express');
var router = express.Router();
var dbconnection = require('../lib/db');

router.get('/',function(req,res, next){
    const query = "SELECT * FROM assignment";
    dbconnection.query(query, function(err,rows){
        if(err) {
            res.render('assignment',{title:'assignment',assignment:''})
        } else {
            res.render('assignment',{title:'assignment',assignment:rows})
        }
    });
  });

  module.exports = router;