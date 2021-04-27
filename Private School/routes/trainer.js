var express = require('express');
var router = express.Router();
var dbconnection = require('../lib/db');
var Trainer = require('../models/trainers');

router.get('/',function(req,res, next){
    const query = "SELECT * FROM trainer";
    dbconnection.query(query, function(err,rows){
        if(err) {
            res.render('trainer',{title:'trainer - ERROR',trainer:'',})
        } else {
            res.render('trainer',{title:'trainer',trainer:rows,})
        }
    });
  });

  router.get('/add', function(req, res, next) {
    res.render('add_trainer', { title: 'add-trainer', message:''});
});

router.post('/add', function(req, res, next) {
    let trainer = new Trainer(undefined,req.body.lastname, req.body.firstname, req.body.subject);
    const query = `INSERT INTO trainer (lastname,firstname,subject) VALUES ('${trainer.lastname}','${trainer.firstname}','${trainer.subject}')`;
    dbconnection.query(query, function(err, result){
        if(err) {
            res.render("add_trainer", { title: 'add_trainer',message: "Error inserting data to the database!"});
        } 
        else {
            res.redirect('/trainer');
        }  
    })
});

module.exports = router;