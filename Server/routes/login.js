const crypto = require('crypto');
const express = require('express');
const router = express.Router();
const aws = require('aws-sdk');
const s3 = new aws.S3()
aws.config.loadFromPath('./config/aws_config.json');
const pool = require('../config/db_pool');
const multer = require('multer');
const multerS3 = require('multer-s3');
const moment = require('moment');


router.post('/', function(req, res, next){//성공
  pool.getConnection(function(err, conn){
    if(err){
      console.log('getConnectionError: ', err);
      res.status(501).send({
        'message': 'Get Connection Error'
      });
    }
    else{
      console.log(req.body);
      var email = req.body.email;
      var password = req.body.password;
      var token = req.body.token;
      var cipher = crypto.createCipher('aes192', 'mypassword');
      var passwd_hash = cipher.update(password, 'utf8', 'base64');
      passwd_hash += cipher.final('base64');
      console.log(passwd_hash);
      let query = 'Select id, team_id from player where (email=? and password=?) or (email=? and token=?)';    // team_id추가
      conn.query(query, [email, password==''?'':passwd_hash, email, token], function(err, data){
        console.log('a');
        console.log(data[0].id);
        if(err){
          console.log('queryError: ', err);
          res.status(501).send({
            'message': 'Select Query Error'
          });
        }
        else{
          if(data.length == 1){
            if(token!=''){
              let query1 = 'Update player set token=? where id=?';
              conn.query(query1, [token, data[0].id], function(err){
                console.log('abab');
                if(err){
                  console.log('queryError: ', err);
                  res.status(501).send({
                    'message': 'Select Query Error'
                  });
                }
                else{
                  console.log('finish');
                  res.status(200).send({
                    'response': data[0]
                  });
                }
              });
            }
            else{
              console.log('finishi');
              res.status(200).send({
                'response': data[0]
              });
            }
          }
          else{
            res.status(400).send({
              'message': 'Invalid email or password'
            });
          }
        }
        conn.release();
      });
    }
  });
});

module.exports = router;
