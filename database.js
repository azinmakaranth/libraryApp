const mysql = require('mysql');

var conParam = {
  host     : 'localhost',
  user     : 'root',
  password : '123'
}
//connection Variable
var con = mysql.createConnection(conParam);
con.connect(function(err) {
  if (err) {
    console.error('error connecting: ' + err);
    return;
  }
  console.log('connected as id ' + con.threadId + '\n Checking DB....');
  con.query('CREATE DATABASE library;', function (error, results, fields) {
  if (error)
          console.log(`Database 'library' Exists`);
  else{
      const importer = require('node-mysql-importer');
      importer.config({
            'host': conParam.host,
            'user': conParam.user,
            'password': conParam.password,
            'database': 'library'
      });
     importer.importSQL('library.sql').then( () => {
           console.clear();
           console.log(`Database 'library' Created`);
           console.log(`All Tables Created.\n Goto ${conParam.host}/3000`)
     }).catch( err => {
          console.log(`error: ${err}`)
    });
   }
   });
});
module.exports = {
  con
};
