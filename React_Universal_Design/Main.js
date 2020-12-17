const express = require('express');
const app = express();
const path = require('path');
const mysql = require('mysql');
const session = require('express-session');
const MySQLStore = require("express-mysql-session")(session);
const Router = require('./Router');
const fileUpload = require('express-fileupload');


app.use(express.static(path.join(__dirname, 'build')));
app.use(express.json());
app.use(fileUpload());

//Use middleware for uploading pdf file

// Database connection
const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'myapp'
});



db.connect(function (err) {
    if (err) {
        console.log('DB error');
        throw err;
        return false;
    }
});

const sessionStore = new MySQLStore(
    {   expiration: (1825 * 86400 * 1000),
        endConnectionOnClose: false
    }, db);

app.use(session({
    key: '4236tyhe7jjer76r68',
    secret: 'edfgetgeryht5hujsr',
    store: sessionStore,
    resave: false,
    saveUninitialized: false,
    cookie: {
        maxAge: (1825 * 86400 * 1000),
        httpOnly: false
    }
}));




new Router(app, db);
app.get("/*", function (req,res) {
    res.sendFile(path.join(__dirname,'build','index.html'))
});

app.listen(4567);



