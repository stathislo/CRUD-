var express = require('express');
var router = express.Router();
var dbconnection = require('../lib/db');
var Student = require('../models/students');

router.get('/',function(req,res, next){
    const query = "SELECT * FROM student";
    dbconnection.query(query, function(err,rows){
        if(err) {
            res.render('student',{title:'student',student:''})
        } else {
            res.render('student',{title:'student',student:rows})
        }
    });
  });

  router.get('/add', function(req, res, next) {
    res.render('add_student', { title: 'add_student', message:'' });
});

router.post('/add', function(req, res, next) {
    let student = new Student(undefined,req.body.firstname, req.body.lastname, req.body.date_of_birth, req.body.tuition_fees);
    const query = `INSERT INTO student (firstname,lastname,date_of_birth,tuition_fees) VALUES ('${student.firstname}','${student.lastname}','${student.date_of_birth}','${student.tuition_fees}')`
    dbconnection.query(query,function(err, status){
        if(err) {
            res.render("add_student", { title: 'add_student', message: "Error inserting data to the database!" });
        } 
        else {
            res.redirect('/student')
        }  
    })
});

module.exports = router;