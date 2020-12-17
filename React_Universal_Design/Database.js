
let mysql = require('mysql');

let con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: ""
});

class Database {
    

    createDatabase() {
        con.connect(function (err) {
            if (err) throw err;
            console.log("Connected!");
            con.query("CREATE DATABASE PraktiskIT", function (err, result) {
                if (err) throw err;
                console.log("Database created");
            });
        });


    }

}