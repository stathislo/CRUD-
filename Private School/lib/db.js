var mysql2 = require("mysql2");

var connection = mysql2.createConnection({
    host:'localhost',
    user:'root',
    password:'lost',
    database:'privateschool',
    port:3306
});

connection.connect(function(error) {
    if(error) {
        console.log(error);
    } else {
        console.log("Connected!");
    }
});

module.exports = connection;