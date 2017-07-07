const express = require('express');
const path = require('path');
const router = express.Router();
const aws = require('aws-sdk');
const s3 = new aws.S3()
aws.config.loadFromPath('./config/aws_config.json');
const pool = require('../config/db_pool');
const multer = require('multer');
const multerS3 = require('multer-s3');
const moment = require('moment');

//postman으로 테스트할때 profil_pic 맨밑에서 테스트
const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, path.join(__dirname, '../public') + '/images/profileImg/team/') // cb 콜백함수를 통해 전송된 파일 저장 디렉토리 설정
  },
  filename: function (req, file, cb) {
    //console.log(6);
    cb(null, req.body.teamname + '_profile.' + file.originalname.split('.').pop()) // cb 콜백함수를 통해 전송된 파일 이름 설정
  }
});
const upload = multer({ storage: storage });

router.get('/', function(req, res, next){//성공
  pool.getConnection(function(err, conn){
    if(err){
      console.log('getConnectionError: ', err);
      res.status(501).send({
        'message': 'Get Connection Error'
      });
    }
    else{
      let query = 'Select id, teamname, region, manager from team';
      conn.query(query, function(err, data){
        if(err){
          console.log('queryError: ', err);
          res.status(501).send({
            'message': 'Select query error'
          });
        }
        else{
          res.status(200).send({
            'response': data
          });
        }
        conn.release();
      });
    }
  });
});

router.get('/rank', function(req, res, next){//성공
  pool.getConnection(function(err, conn){
    if(err){
      console.log('getConnectionError: ', err);
      res.status(501).send({
        'message': 'Get Connection Error'
      });
    }
    else{
      let query = 'Select id, teamname, total_game, win_game, draw_game, lose_game, rank from team order by rank';
      conn.query(query, function(err, data){
        if(err){
          console.log('queryError: ', err);
          res.status(501).send({
            'message': 'Select query error'
          });
        }
        else{
          res.status(200).send({
            'response': data
          });
        }
        conn.release();
      });
    }
  });
});

router.post('/', upload.single('profile_pic'), function(req, res, next){//성공
  pool.getConnection(function(err, conn){
    if(err){
      console.log('getConnectionError: ', err);
      res.status(501).send({
        'message': 'Get Connection Error'
      });
    }
    else{
      console.log(req.body);
      var teamname = req.body.teamname;
      let query = 'Select 1 from team where teamname=?';
      conn.query(query, [teamname], function(err, data){
        if(err){
          console.log('queryError: ', err);
          res.status(501).send({
            'message': 'Select Query Error'
          });
        }
        else{
          if(data.length == 1){
            res.status(400).send({
              'message': 'Already exists teamname.'
            });
          }
          else{
            var region = req.body.region;
            var manager = req.body.manager;
            var found_dt = req.body.found_dt;
            var message = req.body.message;
            let query2 = 'Insert into team (profile_pic_url, teamname, region, manager, found_dt, message) values (?, ?, ?, ?, ?, ?)';
            conn.query(query2, [req.file==null?'default.png':teamname + '_profile.' + req.file.originalname.split('.').pop(), teamname, region, manager, found_dt, message], function(err, data2){
              if(err){
                console.log('queryError: ', err);
                res.status(501).send({
                  'message': 'Insert Query Error'
                });
              }
              else{
                res.status(200).send({
                  'team_id': data2.insertId
                });
              }
            });
          }
        }
        conn.release();
      });
    }
  });
});


router.get('/:team_id', function(req, res, next){//성공
  var team_id = req.params.team_id;
  pool.getConnection(function(err, conn){
    if(err){
      console.log('getConnectionError: ', err);
      res.status(501).send({
        'message': 'Get Connection Error'
      });
    }
    else{
      let query = 'Select id, profile_pic_url, teamname, rank, total_game, win_game, draw_game, \
      lose_game, total_score, total_score_against, region, manager, found_dt, message from team where id=?';
      conn.query(query, [team_id], function(err, data){
        if(err){
          console.log('queryError: ', err);
          res.status(501).send({
            'message': 'Select query error'
          });
        }
        else{
          res.status(200).send({
            'response': data[0]
          });
        }
        conn.release();
      });
    }
  });
});

router.get('/:team_id/members', function(req, res, next){//성공
  var team_id = req.params.team_id;
  pool.getConnection(function(err, conn){
    if(err){
      console.log('getConnectionError: ', err);
      res.status(501).send({
        'message': 'Get Connection Error'
      });
    }
    else{
      let query = 'Select id, backnumber, username, age, position, total_game, score, assist from player where team_id=?';
      conn.query(query, [team_id], function(err, data){
        if(err){
          console.log('queryError: ', err);
          res.status(501).send({
            'message': 'Select query error'
          });
        }
        else{
          res.status(200).send({
            'response': data
          });
        }
        conn.release();
      });
    }
  });
});

router.post('/:team_id/members/dupcheck', function(req, res, next){//성공
  var team_id = req.params.team_id;
  pool.getConnection(function(err, conn){
    if(err){
      console.log('getConnectionError: ', err);
      res.status(501).send({
        'message': 'Get Connection Error'
      });
    }
    else{
      console.log(req.body);
      var backnumber = req.body.backnumber;
      let query = 'Select 1 from player p where p.team_id=? and p.backnumber=?';
      conn.query(query, [team_id, backnumber], function(err, data){
        if(err){
          console.log('queryError: ', err);
          res.status(501).send({
            'message': 'Select query error'
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

router.get('/:team_id/members/sort', function(req, res, next){//성공
  var team_id = req.params.team_id;
  pool.getConnection(function(err, conn){
    if(err){
      console.log('getConnectionError: ', err);
      res.status(501).send({
        'message': 'Get Connection Error'
      });
    }
    else{
      let query = 'Select id, backnumber, username, age, position, total_game, score, assist, profile_pic_url from player where team_id=? order by score desc, assist desc, total_game';
      conn.query(query, [team_id], function(err, data){
        if(err){
          console.log('queryError: ', err);
          res.status(501).send({
            'message': 'Select query error'
          });
        }
        else{
          let query1 = 'Select id, backnumber, username, age, position, total_game, score, assist, profile_pic_url from player where team_id=? order by assist desc, score desc, total_game';
          conn.query(query1, [team_id], function(err, data1){
            if(err){
              console.log('queryError: ', err);
              res.status(501).send({
                'message': 'Select query error'
              });
            }
            else{
              res.status(200).send({
                'response': {
                  'score': data,
                  'assist': data1
                }
              });
            }
          });
        }
        conn.release();
      });
    }
  });
});

router.post('/:team_id/schedule', function(req, res, next){// 성공
  var team_id = req.params.team_id;
  pool.getConnection(function(err, conn){
    if(err){
      console.log('getConnectionError: ', err);
      res.status(501).send({
        'message': 'Get Connection Error'
      });
    }
    else{
      console.log(req.body);
      var game_dt = req.body.game_dt;
      var place = req.body.place;
      var against_team = req.body.against_team;
      var message = req.body.message;
      let query = 'Insert into schedule (team_id, game_dt, place, against_team, message) values (?, ?, ?, ?, ?)';
      conn.query(query, [team_id, game_dt, place, against_team, message], function(err){
        if(err){
          console.log('queryError: ', err);
          res.status(501).send({
            'mesage': 'Insert query error'
          });
        }
        else{
          res.status(200).send({
            'message': 'Craete schedule complete'
          });
        }
        conn.release();
      });
    }
  });
});

router.get('/:team_id/schedule', function(req, res, next){// 성공
  var team_id = req.params.team_id;
  pool.getConnection(function(err, conn){
    if(err){
      console.log('getConnectionError: ', err);
      res.status(501).send({
        'message': 'Get Connection Error'
      });
    }
    else{
      let query = 'Select id, game_dt, place, against_team, message, score_team, score_against_team, attendee, tactic from schedule where team_id=? order by game_dt desc';
      conn.query(query, [team_id], function(err, data){
        if(err){
          console.log('queryError: ', err);
          res.status(501).send({
            'mesage': 'Select query error'
          });
        }
        else{
          res.status(200).send({
            'response': data
          });
        }
        conn.release();
      });
    }
  });
});

router.get('/:team_id/schedule/year/:year/month/:month', function(req, res, next){// 성공
  var team_id = req.params.team_id;
  var year = req.params.year;
  var month = req.params.month;
  pool.getConnection(function(err, conn){
    if(err){
      console.log('getConnectionError: ', err);
      res.status(501).send({
        'message': 'Get Connection Error'
      });
    }
    else{
      let query = 'Select id, game_dt, place, against_team, message from schedule where team_id=? and year(game_dt)=? and month(game_dt)=?';
      conn.query(query, [team_id, year, month], function(err, data){
        if(err){
          console.log('queryError: ', err);
          res.status(501).send({
            'mesage': 'Select query error'
          });
        }
        else{
          res.status(200).send({
            'response': data
          });
        }
        conn.release();
      });
    }
  });
});

router.get('/:team_id/report/month', function(req, res, next){// 성공
  var team_id = req.params.team_id;
  pool.getConnection(function(err, conn){
    if(err){
      console.log('getConnectionError: ', err);
      res.status(501).send({
        'message': 'Get Connection Error'
      });
    }
    else{
      let query = 'Select year(s.game_dt) as year, month(s.game_dt) as month, avg(s.score_team) as avg_score, avg(s.score_against_team) as avg_score_against from schedule s, team t where t.id=? and t.id=s.team_id and s.score_team>=0 group by year(s.game_dt), month(s.game_dt) order by year(s.game_dt) desc, month(s.game_dt) desc';
      conn.query(query, [team_id], function(err, data){
        if(err){
          console.log('queryError: ', err);
          res.status(501).send({
            'mesage': 'Select query error'
          });
        }
        else{
          res.status(200).send({
            'response': data
          });
        }
        conn.release();
      });
    }
  });
});

router.get('/:team_id/report/tactic', function(req, res, next){// 성공
  var team_id = req.params.team_id;
  pool.getConnection(function(err, conn){
    if(err){
      console.log('getConnectionError: ', err);
      res.status(501).send({
        'message': 'Get Connection Error'
      });
    }
    else{
      let query = 'Select tactic, count(*) as total_game from schedule s where s.team_id=? group by tactic';
      conn.query(query, [team_id], function(err, data){
        if(err){
          console.log('queryError: ', err);
          res.status(501).send({
            'mesage': 'Select query error'
          });
        }
        else{
          let query1 = 'Select tactic, count(*) as win_game from schedule s where s.team_id=? and s.score_team>s.score_against_team group by tactic';
          conn.query(query1, [team_id], function(err, data1){
            if(err){
              console.log('queryError: ', err);
              res.status(501).send({
                'mesage': 'Select query error'
              });
            }
            else{
              let query2 = 'Select tactic, count(*) as draw_game from schedule s where s.team_id=? and s.score_team=s.score_against_team group by tactic';
              conn.query(query2, [team_id], function(err, data2){
                if(err){
                  console.log('queryError: ', err);
                  res.status(501).send({
                    'mesage': 'Select query error'
                  });
                }
                else{
                  let query3 = 'Select tactic, count(*) as lose_game from schedule s where s.team_id=? and s.score_team<s.score_against_team group by tactic';
                  conn.query(query3, [team_id], function(err, data3){
                    if(err){
                      console.log('queryError: ', err);
                      res.status(501).send({
                        'mesage': 'Select query error'
                      });
                    }
                    else{
                      result = [
                        {'tactic': '4-5-1', 'total_game': 0, 'win_game': 0, 'draw_game': 0, 'lose_game': 0},
                        {'tactic': '4-4-2', 'total_game': 0, 'win_game': 0, 'draw_game': 0, 'lose_game': 0},
                        {'tactic': '4-3-3', 'total_game': 0, 'win_game': 0, 'draw_game': 0, 'lose_game': 0},
                        {'tactic': '3-5-2', 'total_game': 0, 'win_game': 0, 'draw_game': 0, 'lose_game': 0},
                        {'tactic': '3-4-3', 'total_game': 0, 'win_game': 0, 'draw_game': 0, 'lose_game': 0}
                      ];
                      for(var i=0;i<5;i++){
                        var tactic = result[i].tactic;
                        for(var j=0;j<data.length;j++){
                          if(data[j].tactic == tactic) result[i]['total_game']=data[j].total_game;
                        }
                        for(var j=0;j<data1.length;j++){
                          if(data1[j].tactic == tactic) result[i]['win_game']=data1[j].win_game;
                        }
                        for(var j=0;j<data2.length;j++){
                          if(data2[j].tactic == tactic) result[i]['draw_game']=data2[j].draw_game;
                        }
                        for(var j=0;j<data3.length;j++){
                          if(data3[j].tactic == tactic) result[i]['lose_game']=data3[j].lose_game;
                        }
                      }
                      res.status(200).send({
                        'response': result
                      });
                    }
                  });
                }
              });
            }
          });
        }
        conn.release();
      });
    }
  });
});

module.exports = router;
