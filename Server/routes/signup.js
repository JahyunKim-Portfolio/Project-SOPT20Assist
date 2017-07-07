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
const path = require('path');
const storage = multer.diskStorage({
  destination: function (req, file, cb){
    cb(null, path.join(__dirname, '../public') + '/images/profileImg/player/')
  },
  filename: function (req, file, cb){
    cb(null, req.body.email + '_profile.' + file.originalname.split('.').pop())
  }
});

const upload = multer({storage: storage});

//postman으로 테스트할때 profil_pic 맨밑에서 테스트
router.post('/', upload.single('profile_pic'), function(req, res){//성공
  pool.getConnection(function(error, connection){
    if(error){
      console.log('getConnection Error:', error);
      res.status(501).send({
        'message':'Insert Post Error: Get Connection Error',
      });
    }
    else{
      console.log(req.body);
      let checkEmailQuery = 'select * from player where email=?';
      let insertQuery = 'Insert into player (profile_pic_url, username, email, password, token, age, height, weight, foot, position, position_detail, backnumber, team_id) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)';
      let passwd = req.body.password==null?'':req.body.password;
      var cipher = crypto.createCipher('aes192', 'mypassword');
      var passwd_hash = cipher.update(passwd, 'utf8', 'base64');
      passwd_hash += cipher.final('base64');
      if(req.body.username == null || req.body.email == null || (req.body.password == null && req.body.token == null) || req.body.age == null || req.body.height == null || req.body.weight == null || req.body.foot == null
        || req.body.position == null || req.body.position_detail == null || req.body.backnumber == null || req.body.team_id == null){
        res.status(503).send({
          'message': 'Please input all content'
        });
      }
      else{
        connection.query(checkEmailQuery, [req.body.email], function(err, data){
          if(err){
            console.log('query Error:', err);
            res.status(501).send({
              'message':'checkEmail Post Error: checkEmailQuery Error'
            });
          }
          else {
            if(data.length == 1){
              res.status(400).send({
                'message':'duplicate Error: emailDuplicate Error'
              });
            }
            else{
              connection.query(insertQuery,
                [req.file==null?'default.png':req.body.email + '_profile.' + req.file.originalname.split('.').pop()
                , req.body.username, req.body.email, req.body.passwd==null?null:passwd_hash, req.body.token ,req.body.age, req.body.height, req.body.weight, req.body.foot, req.body.position, req.body.position_detail, req.body.backnumber, req.body.team_id], function(err, data){

                if(err){
                  console.log('query Error:', err);
                  res.status(501).send({
                    'message':'Insert Post Error: Insert Query Error'
                  });
                }
                else res.status(200).send({
                  'response':{
                    'id': data.insertId,
                    'team_id': req.body.team_id
                  }
                });
              });
            }
          }
          connection.release();
        });
      }
    }
  });
});

router.post('/dupcheck', function(req, res){
  pool.getConnection(function(error, conn){
    if(error){
      console.log('getConnection Error:', error);
      res.status(501).send({
        'message':'Insert Post Error: Get Connection Error',
      });
    }
    else{
      console.log(req.body);
      let query = 'Select 1 from player where email=?';
      conn.query(query, [req.body.email], function(err, data){
        if(err){
          console.log('selectQuery error: ', err);
          res.status(503).send({
            'message': 'Select Query Error'
          });
        }
        else{
          res.status(200).send({
            'response': data.length==0?'noduplicate':'duplicate'
          });
        }
        conn.release();
      });
    }
  });
});
module.exports = router;
