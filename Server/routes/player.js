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

router.post('/:player_id', upload.single('profile_pic'), function(req, res, next){
  pool.getConnection(function(error, conn){
    if(error){
      console.log('getConnection Error:', error);
      res.status(501).send({
        'message':'Insert Post Error: Get Connection Error',
      });
    }
    else{
      console.log(body);
      var player_id=req.params.player_id;
      var username = req.body.username;
      var email=req.body.email;
      var age = req.body.age;
      var height = req.body.height;
      var weight = req.body.weight;
      var foot = req.body.foot;
      var position = req.body.position;
      var position_detail = req.body.position_detail;
      var backnumber = req.body.backnumber;
      if(username == null || age == null || height==null || weight==null || foot==null || position==null || position_detail==null || backnumber == null){
        res.status(503).send({
          'message': 'Please input all content'
        });
      }
      else{
        let query = 'Update player set profile_pic_url=?, username=?, age=?, height=?, weight=?, foot=?, position=?, position_detail=?, backnumber=? where id=?';
        conn.query(query, [req.file==null?'default.png':req.body.email + '_profile.' + file.originalname.split('.').pop(), username, age, height, weight, foot, position, position_detail, backnumber, player_id], function(err){
          if(err){
            console.log('Update query error: ', err);
            res.status(501).send({
              'message': 'update query error'
            });
          }
          else{
            res.status(200).send({
              'message': 'update player info success'
            });
          }
        });
      }
    }
  });
});

router.get('/:player_id', function(req, res, next){//성공
  pool.getConnection(function(err, conn){
    if(err){
      console.log('getConnectionError: ', err);
      res.status(501).send({
        'message': 'Get Connection Error'
      });
    }
    else{
      var player_id = req.params.player_id;
      let query = 'Select * from player where id=?';
      conn.query(query, [player_id], function(err, data){
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



router.get('/:player_id/report/affect/team', function(req, res, next){
  pool.getConnection(function(err, conn){
    if(err){
      console.log('getConnectionError: ', err);
      res.status(501).send({
        'message': 'Get Connection Error'
      });
    }
    else{
      var player_id = req.params.player_id;
      let query1 = 'Select count(*) as cnt from attendee a, schedule s where a.schedule_id=s.id and s.score_team!=-1 and a.player_id=? and a.attendance=\'attend\'';
      //AttendTotalGame
      conn.query(query1, [player_id], function(err, data1){
        if(err){
          console.log('queryError: ', err);
          res.status(501).send({
            'message': 'Select query1 error'
          });
        }
        else{
          let query2 = 'Select count(*) as cnt from attendee a, schedule s where a.schedule_id=s.id and s.score_team!=-1 and a.player_id=? and a.attendance=\'attend\' and s.score_team > s.score_against_team';
          //AttendWinGame
          conn.query(query2, [player_id], function(err, data2){
            if(err){
              console.log('queryError: ', err);
              res.status(501).send({
                'message': 'Select query2 error'
              });
            }
            else{
              let query3 = 'Select sum(s.score_team) as sum_score_attend_team from attendee a, schedule s where a.schedule_id=s.id and s.score_team!=-1 and a.player_id=? and a.attendance=\'attend\'';
              //내가 참여할 경우 평균득점
              conn.query(query3, [player_id], function(err, data3){
                if(err){
                  console.log('queryError: ', err);
                  res.status(501).send({
                    'message': 'Select query3 error'
                  });
                }
                else{
                  let query4 = 'Select sum(s.score_against_team) as sum_score_against_attend_team from attendee a, schedule s where a.schedule_id=s.id and s.score_team!=-1 and a.player_id=? and a.attendance=\'attend\'';
                   //내가 참여할 경우 평균실점
                   conn.query(query4, [player_id], function(err, data4){
                     if(err){
                       console.log('queryError: ', err);
                       res.status(501).send({
                         'message': 'Select query4 error'
                       });
                     }
                     else{
                       let query5 = 'Select count(*) as cnt  from attendee a, schedule s where a.schedule_id=s.id and s.score_team=-1 and a.player_id=? and a.attendance=\'noattend\'';
                       //NoAttendTotalGame
                       conn.query(query5, [player_id], function(err, data5){
                         if(err){
                           console.log('queryError: ', err);
                           res.status(501).send({
                             'message': 'Select query5 error'
                           });
                         }
                         else{
                           let query6 = 'Select count(*)  as cnt from attendee a, schedule s where a.schedule_id=s.id and s.score_team!=-1 and a.player_id=? and a.attendance=\'noattend\' and s.score_team > s.score_against_team';
                           //NoAttendWinGame
                           conn.query(query6, [player_id], function(err, data6){
                             if(err){
                               console.log('queryError: ', err);
                               res.status(501).send({
                                 'message': 'Select query6 error'
                               });
                             }
                             else{
                               let query7 = 'Select sum(s.score_team) as sum_score_team from attendee a, schedule s where a.schedule_id=s.id and s.score_team!=-1 and a.player_id=? and a.attendance=\'noattend\'';
                                //내가 불참여할 경우 평균득점
                                conn.query(query7, [player_id], function(err, data7){
                                  if(err){
                                    console.log('queryError: ', err);
                                    res.status(501).send({
                                      'message': 'Select query7 error'
                                    });
                                  }
                                  else{
                                    let query8 = 'Select sum(s.score_against_team) as sum_score_against_team from attendee a, schedule s where a.schedule_id=s.id and s.score_team!=-1 and a.player_id=? and a.attendance=\'noattend\'';
                                     //내가 불참여할 경우 평균실점
                                     conn.query(query8, [player_id], function(err, data8){
                                       if(err){
                                         console.log('queryError: ', err);
                                         res.status(501).send({
                                           'message': 'Select query8 error'
                                         });
                                       }
                                       else{
                                         //var AttendWinGame = data2[0].cnt;
                                         var AttendTotalGame = data1[0].cnt;
                                         //var AttendWinPercent = (AttendWinGame/AttendTotalGame)*100;

                                         //var NoAttendWinGame = data6[0].cnt;
                                         var NoAttendTotalGame = data5[0].cnt;
                                         //var NoAttendWinPercent = (NoAttendWinGame/NoAttendTotalGame)*100;

                                         res.status(200).send({
                                           'response':{
                                             'attend':{
                                               //(AttendWinGame/AttendTotalGame)*100 이부분이 잘못들어가는듯,,
                                               'total_game': AttendTotalGame,
                                               'win_game': data2[0].cnt,
                                               'score_team': data3[0].sum_score_attend_team==null?0:data3[0].sum_score_attend_team,
                                               'score_against_team': data4[0].sum_score_against_attend_team==null?0:data4[0].sum_score_against_attend_team
                                             },
                                             'noattend':{
                                               //(NoAttendWinGame/NoAttendTotalGame)*100 이부분이 잘못들어가는듯,,
                                               'total_game': NoAttendTotalGame,
                                               'win_game': data6[0].cnt,
                                               'score_team': data7[0].sum_score_team==null?0:data7[0].sum_score_team,
                                               'score_against_team': data8[0].sum_score_against_team==null?0:data8[0].sum_score_against_team
                                             }
                                           }
                                         });
                                       }
                                     });
                                  }
                                });
                             }
                           });
                         }
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


// 특정 선수 월별 총 경기 수, 승 경기 수, 득점, 도움, 실점
router.get('/:player_id/report/month', function(req, res, next){ // 성공
  pool.getConnection(function(err, conn){
    if(err){
      console.log('getConnectionError: ', err);
      res.status(501).send({
        'message': 'Get Connection Error'
      });
    }
    else{
      var player_id=req.params.player_id;
      let query = 'Select year(s.game_dt) as year, month(s.game_dt) as month, count(*) as total_game from schedule s, attendee a where a.player_id=? and a.attendance=\'attend\' and a.schedule_id=s.id group by year(s.game_dt), month(s.game_dt) order by year(s.game_dt) desc, month(s.game_dt) desc';
      conn.query(query, [player_id], function(err, data){
        if(err){
          console.log('queryError: ', err);
          res.status(501).send({
            'message': 'Select Query Error'
          });
        }
        else{
          let query1 = 'Select year(s.game_dt) as year, month(s.game_dt) as month, count(*) as win_game from schedule s, attendee a where a.player_id=? and a.attendance=\'attend\' and a.schedule_id=s.id and s.score_team>s.score_against_team group by year(s.game_dt), month(s.game_dt) order by year(s.game_dt) desc, month(s.game_dt) desc';
          conn.query(query1, [player_id], function(err, data1){
            if(err){
              console.log('queryError: ', err);
              res.status(501).send({
                'message': 'Select Query Error'
              });
            }
            else{
              let query2 = 'Select year(s.game_dt) as year, month(s.game_dt) as month, count(*) as score from schedule s, event e where e.player_id=? and s.id=e.schedule_id and e.type=\'score\' group by year(s.game_dt), month(s.game_dt) order by year(s.game_dt) desc, month(s.game_dt) desc';
              conn.query(query2, [player_id], function(err, data2){
                if(err){
                  console.log('queryError: ', err);
                  res.status(501).send({
                    'message': 'Select Query Error'
                  });
                }
                else{
                  let query3 = 'Select year(s.game_dt) as year, month(s.game_dt) as month, count(*) as assist from schedule s, event e where e.player_id=? and s.id=e.schedule_id and e.type=\'assist\' group by year(s.game_dt), month(s.game_dt) order by year(s.game_dt) desc, month(s.game_dt) desc';
                  conn.query(query3, [player_id], function(err, data3){
                    if(err){
                      console.log('queryError: ', err);
                      res.status(501).send({
                        'message': 'Select Query Error'
                      });
                    }
                    else{
                      let query4 = 'Select year(s.game_dt) as year, month(s.game_dt) as month, count(*) as score_against from schedule s, event e, player p where p.id=? and s.team_id=p.team_id and e.schedule_id=s.id and e.type=\'score_against\' group by year(s.game_dt), month(s.game_dt) order by year(s.game_dt) desc, month(s.game_dt) desc';
                      conn.query(query4, [player_id], function(err, data4){
                        if(err){
                          console.log('queryError: ', err);
                          res.status(501).send({
                            'message': 'Select Query Error'
                          });
                        }
                        else{
                          result = [];
                          for(var i =0;i<data.length;i++) result.push({'year': data[i].year, 'month': data[i].month, 'total_game': data[i].total_game, 'win_game': 0, 'score': 0, 'assist': 0, 'score_against':0});
                          for(var i=0;i<data1.length;i++){
                            for(var j=i;j<result.length;j++){
                              if(result[j].year==data1[i].year && result[j].month==data1[i].month){
                                 result[j].win_game = data1[i].win_game;
                                 break;
                              }
                            }
                          }
                          for(var i=0;i<data2.length;i++){
                            for(var j=i;j<result.length;j++){
                              if(result[j].year==data2[i].year && result[j].month==data2[i].month){
                                 result[j].score = data2[i].score;
                                 break;
                              }
                            }
                          }
                          for(var i=0;i<data3.length;i++){
                            for(var j=i;j<result.length;j++){
                              if(result[j].year==data3[i].year && result[j].month==data3[i].month){
                                 result[j].assist = data3[i].assist;
                                 break;
                              }
                            }
                          }

                          for(var i=0;i<data4.length;i++){
                            for(var j=i;j<result.length;j++){
                              if(result[j].year==data4[i].year && result[j].month==data4[i].month){
                                 result[j].score_against = data3[i].score_against;
                                 break;
                              }
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
          });
        }
      });
    }
  });
});


router.get('/:player_id/report/affect/position', function(req, res, next){
  pool.getConnection(function(err, conn){
    if(err){
      console.log('getConnectionError: ', err);
      res.status(501).send({
        'message': 'Get Connection Error'
      });
    }
    else{
      var player_id = req.params.player_id;
      let query = 'Select count(*) as total_game, a.position from attendee a where a.player_id=? and a.attendance=\'attend\' and a.position is not null group by a.position';
      conn.query(query, [player_id], function(err, data){
        if(err){
          console.log('getConnectionError: ', err);
          res.status(501).send({
            'message': 'Get Connection Error'
          });
        }
        else{
          let query1 = 'Select count(*) as score, a.position from event e, attendee a where e.schedule_id=a.schedule_id and e.type=\'score\' and e.player_id=? and a.player_id=e.player_id group by a.position';
          conn.query(query1, [player_id], function(err, data1){
            if(err){
              console.log('getConnectionError: ', err);
              res.status(501).send({
                'message': 'Get Connection Error'
              });
            }
            else{
              let query2 = 'Select count(*) as assist, a.position from event e, attendee a where e.schedule_id=a.schedule_id and e.type=\'assist\' and e.player_id=?  and a.player_id=e.player_id group by a.position';
              conn.query(query2, [player_id], function(err, data2){
                if(err){
                  console.log('getConnectionError: ', err);
                  res.status(501).send({
                    'message': 'Get Connection Error'
                  });
                }
                else{
                  let query3 = 'Select count(*) as no_score_against, a.position from attendee a, schedule s where a.schedule_id=s.id and a.attendance=\'attend\' and a.player_id=? and s.score_against_team=0 group by a.position';
                  conn.query(query3, [player_id], function(err, data3){
                    if(err){
                      console.log('getConnectionError: ', err);
                      res.status(501).send({
                        'message': 'Get Connection Error'
                      });
                    }
                    else{
                      let query4 = 'Select sum(score_against_team) as score_against_team, a.position from attendee a, schedule s where a.schedule_id=s.id and a.attendance=\'attend\' and a.position is not null and a.player_id=? group by a.position';
                      conn.query(query4, [player_id], function(err, data4){
                        if(err){
                          console.log('getConnectionError: ', err);
                          res.status(501).send({
                            'message': 'Get Connection Error'
                          });
                        }
                        else{
                          let query5 = 'Select sum(score_team) as score_team, a.position from attendee a, schedule s where a.schedule_id=s.id and a.attendance=\'attend\' and a.player_id=? and a.position is not null group by a.position';
                          conn.query(query5, [player_id], function(err, data5){
                            if(err){
                              console.log('getConnectionError: ', err);
                              res.status(501).send({
                                'message': 'Get Connection Error'
                              });
                            }
                            else{
                              let query6 = 'Select count(*) as win_game, a.position from attendee a, schedule s where a.schedule_id=s.id and a.attendance=\'attend\' and a.player_id=? and s.score_against_team<s.score_team group by a.position';
                              conn.query(query6, [player_id], function(err, data6){
                                if(err){
                                  console.log('getConnectionError: ', err);
                                  res.status(501).send({
                                    'message': 'Get Connection Error'
                                  });
                                }
                                else{
                                  var result = {
                                    'ATK': {'total_game':0, 'score':0, 'assist':0, 'score_team':0, 'score_against_team':0, 'no_score_against':0, 'win_game':0},
                                    'MF': {'total_game':0, 'score':0, 'assist':0, 'score_team':0, 'score_against_team':0, 'no_score_against':0, 'win_game':0},
                                    'DF': {'total_game':0, 'score':0, 'assist':0, 'score_team':0, 'score_against_team':0, 'no_score_against':0, 'win_game':0},
                                    'GK': {'total_game':0, 'score':0, 'assist':0, 'score_team':0, 'score_against_team':0, 'no_score_against':0, 'win_game':0},
                                    'SUB': {'total_game':0, 'score':0, 'assist':0, 'score_team':0, 'score_against_team':0, 'no_score_against':0, 'win_game':0}
                                  }

                                  for(var i=0;i<data.length;i++) result[data[i].position].total_game = data[i].total_game;
                                  for(var i=0;i<data1.length;i++) result[data1[i].position].score = data1[i].score;
                                  for(var i=0;i<data2.length;i++) result[data2[i].position].assist = data2[i].assist;
                                  for(var i=0;i<data3.length;i++) result[data3[i].position].no_score_against = data3[i].no_score_against;
                                  for(var i=0;i<data4.length;i++) result[data4[i].position].score_against_team = data4[i].score_against_team;
                                  for(var i=0;i<data5.length;i++) result[data5[i].position].score_team = data5[i].score_team;
                                  for(var i=0;i<data6.length;i++) result[data6[i].position].win_game = data6[i].win_game;
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
                  });
                }
              });
            }
          });
        }
      });
    }
  });
});


module.exports = router;
