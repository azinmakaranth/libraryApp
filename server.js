const db = require('./database.js');
const express = require('express');
const ejs = require('ejs');
const request = require('request');
const port = 3000;
var app =express();
app.set('view engine','ejs');
app.use(express.static(__dirname + '/views/public'));

app.get('/bookdetails', function(req, res) {
    if(!req.query.book)
         res.status(404).send('Not Found Go Back');
    db.con.query(`select count(*) no from library.authors`,(error,count,fields) => {
    if (error) throw error;
       db.con.query(`select * from library.books where name = '${req.query.book}'`, (error, results, fields) => {
       if (error) throw error;
       {
         res.render('bookdetails',{
           count : count[0].no,
           results: results[0]
         });
       }
     });
  });
});
app.get('/authordetails', function(req, res) {
  if(!req.query.author)
       res.status(404).send('Not Found Go Back');
  db.con.query(`select count(*) no from library.authors`,(error,count,fields) => {
  if (error) throw error;
       db.con.query(`select * from library.authors where name = '${req.query.author}'`, (error, results1, fields) => {
       if (error) throw error;
       {
         db.con.query(`select * from library.books where author = '${req.query.author}'`, (error, results2, fields) => {
         if (error) throw error;
        {
           results2.forEach(e => e.des = e.des.slice(0,60) );
           res.render('authordetails',{
            count : count[0].no,
            no_of: results2.length,
            results1: results1[0],
            results2: results2
        });
       }
     });
    }
   });
  });
});
app.get('/', function(req, res) {
  db.con.query('select * from library.books', (error, results, fields) => {
  if (error) throw error;

  {
    db.con.query(`select name from library.authors`, (error, results1, fields) => {
    if (error) throw error;
           results.forEach(e => e.des = e.des.slice(0,60) );
           res.render('addbook',{
           no_of: results.length,
           results: results,
           resu: results1
        });
       });
  }
 });
});
app.get('/addauthor', function(req, res) {
  db.con.query('select * from library.authors', (error, results, fields) => {
  if (error) throw error;

  {
    res.render('addauthor',{
      no_of: results.length,
      results : results
    });
  }

 });
});
app.get('/addbook', function(req, res) {
        db.con.query(`insert into library.books(isbn,name,author,des) values('${req.query.isbn}','${req.query.bookname}','${req.query.opt}','${req.query.des}')`, (error, results, fields) => {
        if (error) throw error;
        });
        db.con.query('select * from library.books', (error, results, fields) => {
        if (error) throw error;
        {
          db.con.query(`select name from library.authors`, (error, results1, fields) => {
          if (error) throw error;
                 results.forEach(e => e.des = e.des.slice(0,60) );
                 res.render('addbook',{
                 no_of: results.length,
                 results: results,
                 resu: results1
              });
             });
        }
       });
});
app.get('/addathr', function(req, res) {
        db.con.query(`insert into library.authors(name,age,gender,country,about) values('${req.query.authorname}','${req.query.authorage}','${req.query.gender}','${req.query.country}','${req.query.aboutauthor}')`, (error, results, fields) => {
        if (error) throw error;
        });
        db.con.query('select * from library.authors', (error, results, fields) => {
        if (error) throw error;

        {
          res.render('addauthor',{
            no_of: results.length,
            results : results
          });
        }

      });
});
app.get('/getnextauthor', function(req, res) {
        db.con.query(`select  name from library.authors where id =(${req.query.cid}+1)`, (error, results, fields) => {
        if (error) throw error;
             var url = encodeURI('http://localhost:'+port+'/authordetails?author='+results[0].name);
             res.send(url);
        });
});
app.get('/getprevauthor', function(req, res) {
        db.con.query(`select  name from library.authors where id =(${req.query.cid}-1)`, (error, results, fields) => {
        if (error) throw error;
             var url = encodeURI('http://localhost:'+port+'/authordetails?author='+results[0].name);
             res.send(url);
        });
});
app.get('/getnextbook', function(req, res) {
        db.con.query(`select  name from library.books where id =(${req.query.cid}+1)`, (error, results, fields) => {
        if (error) throw error;
             var url = encodeURI('http://localhost:'+port+'/bookdetails?book='+results[0].name);
             res.send(url);
        });
});
app.get('/getprevbook', function(req, res) {
        db.con.query(`select  name from library.books where id =(${req.query.cid}-1)`, (error, results, fields) => {
        if (error) throw error;
             var url = encodeURI('http://localhost:'+port+'/bookdetails?book='+results[0].name);
             res.send(url);
        });
});


app.listen( port ,()=> console.log('Server Is Up @localhost:'+port+' \n Waiting For Response from Mysql'));
