const mysql = require('mysql');
const express = require('express');
const app = express();

const db = mysql.createConnection({
    host: 'localhost',
    user: 'architect',
    password: 'knockknock',
    database: 'abandonbase'
});


db.connect((err) => {
    if(err) throw err;
    console.log('mysql connected!');
});

app.get('/', (req,res) => {
    res.send('Success');
});

app.get('/showgames', (req,res) => {
    let sql = 'SELECT * FROM game NATURAL JOIN genre NATURAL JOIN platform NATURAL JOIN publisher';
    db.query(sql, (err, result) =>{
        if(err) throw err;
        console.log(result);
        res.send(result);
    });
});

app.get('/deletegame/:title', (req,res) => {
	let sql = `DELETE FROM game where title='${req.params.title}'`;
	db.query(sql, (err, result) =>{
        if(err) throw err;
        res.send(`Deleted ${title} from game table`);
    });
});


app.listen('4000', () => {
    console.log('Server started on port 4000');
});
