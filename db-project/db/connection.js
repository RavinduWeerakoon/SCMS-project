const mysql = require('mysql2');
const dotenv = require('dotenv');
dotenv.config();

var pool  = mysql.createPool({
  host            : process.env.HOST,
  user            : process.env.USER,
  password        : process.env.PASSWORD,
  database        : process.env.DATABASE,

});

const connection = mysql.createConnection({
  host: process.env.HOST,
  user: process.env.USER,
  password:process.env.PASSWORD,
  database:process.env.DATABASE,
});

pool.on('acquire', function (connection) {
  console.log('Connection %d acquired', connection.threadId);
});

pool.on('connection', function (connection) {
  console.log('connected')
});

pool.on('enqueue', function () {
  console.log('Waiting for available connection slot');
});


const call_db = async (query, arg) => {

  console.log(query);
  

  return new Promise((resolve, reject) => {
      pool.getConnection(function(err, connection) {
          if (err) {
              reject(err);
          } // not connected!
          
          // Use the connection
          connection.query(query, arg, function (error, results, fields) {
              // When done with the connection, release it.
              connection.release();
              // Handle error after the release.
              if (error) {
                  reject(error);
              }
              resolve(results) ;
              // Don't use the connection here, it has been returned to the pool.
          });
      });
  })

}
module.exports = {pool,call_db, connection};