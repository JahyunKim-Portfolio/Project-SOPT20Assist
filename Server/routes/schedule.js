const express = require('express');
const router = express.Router();
const aws = require('aws-sdk');
const s3 = new aws.S3()
aws.config.loadFromPath('./config/aws_config.json');
const pool = require('../config/db_pool');
const multer = require('multer');
const multerS3 = require('multer-s3');
const moment = require('moment');

router.post('/:schedule_id/attendee', function(req, res, next){//성공
  pool.getConnection(function(err, conn){
    if(err){
      console.log('getConnectionError: ', err);
      res.status(501).send({
        'message': 'Get Connection Error'
      });
    }
    else{
      console.log(req.body);
      var schedule_id = req.params.schedule_id;
      var player_id = req.body.player_id;
      var attendance = req.body.attendance;
      let query = 'Select attendance from attendee where schedule_id=? and player_id=?';
      conn.query(query, [schedule_id, player_id], function(err, data){
        if(err){
          console.log('queryError: ', err);
          res.status(501).send({
            'message': 'Select Query Error'
          });
        }
        if(data.length == 0){
          let query2 = 'Insert into attendee (schedule_id, player_id, attendance) values (?, ?, ?)';
          conn.query(query2, [schedule_id, player_id, attendance], function(err){
            if(err){
              console.log('queryError: ', err);
              res.status(501).send({
                'message': 'Insert Query Error'
              });
            }
            else{
              let query3 = 'Update schedule set attendee=attendee+? where id=?';
              conn.query(query3, [attendance=='attend'?1:0, schedule_id], function(err){
                if(err){
                  console.log('queryError: ', err);
                  res.status(501).send({
                    'message': 'Update Query Error'
                  });
                }
                else{
                  res.status(200).send({
                    'message': 'Insert attendee success.'
                  });
                }
              });
            }
          });
        }
        else{
          let query2 = 'Update attendee set attendance=? where schedule_id=? and player_id=?';
          conn.query(query2, [attendance, schedule_id, player_id], function(err){
            if(err){
              console.log('queryError: ', err);
              res.status(501).send({
                'message': 'Update Query Error'
              });
            }
            else{
              let query3 = 'Update schedule set attendee=attendee+? where id=?';
              conn.query(query3, [data[0].attendance=='attend'?(attendance=='attend'?0:-1):(attendance=='attend'?1:0), schedule_id], function(err){
                if(err){
                  console.log('queryError: ', err);
                  res.status(501).send({
                    'message': 'Update Query Error'
                  });
                }
                else{
                  res.status(200).send({
                    'message': 'update attendee success.'
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

router.get('/:schedule_id/attendee', function(req, res, next){ //성공
  pool.getConnection(function(err, conn){
    if(err){
      console.log('getConnectionError: ', err);
      res.status(501).send({
        'message': 'Get Connection Error'
      });
    }
    else{
      var schedule_id = req.params.schedule_id;
      let query = 'Select p.id, p.username, p.backnumber, p.position from player p, attendee a where a.player_id=p.id and a.schedule_id=? and a.attendance=\'attend\'';
      conn.query(query, [schedule_id], function(err, data){
        if(err){
          console.log('queryError: ', err);
          res.status(501).send({
            'message': 'Select Query Error'
          });
        }
        else{
          let query2 = 'Select p.id, p.username, p.backnumber, p.position from player p, attendee a where a.player_id=p.id and a.schedule_id=? and a.attendance=\'noattend\'';
          conn.query(query2, [schedule_id], function(err, data2){
            if(err){
              console.log('selectQuery Error: ', err);
              res.status(501).send({
                'message': 'Select Query Error'
              });
            }
            else{
              res.status(200).send({
                'response': {
                  'noattend': data2,
                  'attend': data
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

//특정 일정 전술에 따른 참석선수 목록[2017-06-28]
router.get('/:schedule_id/attendee/tactic/:tactic', function(req, res, next){
  pool.getConnection(function(err, conn){
    if(err){
      console.log('getConnectionError: ', err);
      res.status(501).send({
        'message': 'Get Connection Error'
      });
    }
    else{
      var schedule_id = req.params.schedule_id;
      let query = 'Select p.id, p.backnumber, p.username, p.position from player p, attendee a where a.schedule_id=? and a.attendance=\'attend\' and a.player_id=p.id ';
      conn.query(query, [schedule_id], function(err, data){
        var totalAttendance = data.length;

        if(err){
          console.log('queryError: ', err);
          res.status(501).send({
            'message': 'Select Query Error'
          });
        }
        else{
          if(totalAttendance < 11){
            res.status(501).send({
              'message': 'TotalAttendance is less than 11'
            });
          }
          else{
            var tactic = req.params.tactic;
            //희망개수
            var GK_Num = 1;
            var DF_Num = tactic.split('-')[0];
            var MF_Num = tactic.split('-')[1];
            var ATK_Num = tactic.split('-')[2];
            //실제개수
            var GK_Count = [], DF_Count = [], MF_Count = [], ATK_Count = [];
            //결과값
            var DF_Arr = [], MF_Arr = [], ATK_Arr = [], GK_Arr = [], SUB_Arr = [];

            for(var i = 0; i < data.length; i++){
              if(data[i].position == 'GK'){
                GK_Count.push(data[i]);
              }else if(data[i].position == 'DF'){
                DF_Count.push(data[i]);
              }else if(data[i].position == 'MF'){
                MF_Count.push(data[i]);
              }else if(data[i].position == 'ATK'){
                ATK_Count.push(data[i]);
              }
            }

            //GK선발
            if(GK_Count.length >= GK_Num){
              GK_Arr.push({'id': GK_Count[0].id, 'username': GK_Count[0].username, 'backnumber': GK_Count[0].backnumber});
              GK_Count.splice(0, GK_Num);
            }else{
              if(DF_Count.length >= GK_Num){
                GK_Arr.push({'id': DF_Count[0].id, 'username': DF_Count[0].username, 'backnumber': DF_Count[0].backnumber});
                DF_Count.splice(0, GK_Num);
              }else{
                if(MF_Count.length >= GK_Num){
                  GK_Arr.push({'id': MF_Count[0].id, 'username': MF_Count[0].username, 'backnumber': MF_Count[0].backnumber});
                  MF_Count.splice(0, GK_Num);
                }else{
                  if(ATK_Count.length >= GK_Num){
                    GK_Arr.push({'id': ATK_Count[0].id, 'username': ATK_Count[0].username, 'backnumber': ATK_Count[0].backnumber});
                    ATK_Count.splice(0, GK_Num);
                  }
                }
              }
            }

            //ATK선발
            if(ATK_Count.length >= ATK_Num){//희망개수보다 실제개수가 더 큰경우
              for(var i = 0; i < ATK_Num; i++){
                ATK_Arr.push({'id': ATK_Count[i].id, 'username': ATK_Count[i].username, 'backnumber': ATK_Count[i].backnumber});
              }
              ATK_Count.splice(0,ATK_Num);
            }
            else{
              for(var i = 0; i < ATK_Count.length; i++){
                ATK_Arr.push({'id': ATK_Count[i].id, 'username': ATK_Count[i].username, 'backnumber': ATK_Count[i].backnumber});
              }
              ATK_Num = ATK_Num - ATK_Count.length;
              ATK_Count.splice(0, ATK_Count.length);

              if(MF_Count.length >= ATK_Num){
                for(var i = 0; i < ATK_Num; i++){
                  ATK_Arr.push({'id': MF_Count[i].id, 'username': MF_Count[i].username, 'backnumber': MF_Count[i].backnumber});
                }
                MF_Count.splice(0,ATK_Num);
              }else{
                for(var i = 0; i < MF_Count.length; i++){
                  ATK_Arr.push({'id': MF_Count[i].id, 'username': MF_Count[i].username, 'backnumber': MF_Count[i].backnumber});
                }
                ATK_Num = ATK_Num - MF_Count.length;
                MF_Count.splice(0, MF_Count.length);

                if(DF_Count.length >= ATK_Num){
                  for(var i = 0; i < ATK_Num; i++){
                    ATK_Arr.push({'id': DF_Count[i].id, 'username': DF_Count[i].username, 'backnumber': DF_Count[i].backnumber});
                  }
                  DF_Count.splice(0,ATK_Num);
                }else{
                  for(var i = 0; i < DF_Count.length; i++){
                    ATK_Arr.push({'id': DF_Count[i].id, 'username': DF_Count[i].username, 'backnumber': DF_Count[i].backnumber});
                  }
                  ATK_Num = ATKF_Num - DF_Count.length;
                  DF_Count.splice(0, DF_Count.length);

                  if(GK_Count.length >= ATK_Num){
                    for(var i = 0; i < ATK_Num; i++){
                      ATK_Arr.push({'id': GK_Count[i].id, 'username': GK_Count[i].username, 'backnumber': GK_Count[i].backnumber});
                    }
                    GK_Count.splice(0,ATK_Num);
                  }else{
                    for(var i = 0; i < GK_Count.length; i++){
                      ATK_Arr.push({'id': GK_Count[i].id, 'username': GK_Count[i].username, 'backnumber': GK_Count[i].backnumber});
                    }
                    ATK_Num = ATK_Num - GK_Count.length;
                    GK_Count.splice(0, GK_Count.length);
                  }
                }
              }
            }

            //MF선발
            if(MF_Count.length >= MF_Num){//희망개수보다 실제개수가 더 큰경우
              for(var i = 0; i < MF_Num; i++){
                MF_Arr.push({'id': MF_Count[i].id, 'username': MF_Count[i].username, 'backnumber': MF_Count[i].backnumber});
              }
              MF_Count.splice(0,MF_Num);
            }
            else{
              for(var i = 0; i < MF_Count.length; i++){
                MF_Arr.push({'id': MF_Count[i].id, 'username': MF_Count[i].username, 'backnumber': MF_Count[i].backnumber});
              }
              MF_Num = MF_Num - MF_Count.length;
              MF_Count.splice(0, MF_Count.length);

              if(ATK_Count.length >= MF_Num){
                for(var i = 0; i < MF_Num; i++){
                  MF_Arr.push({'id': ATK_Count[i].id, 'username': ATK_Count[i].username, 'backnumber': ATK_Count[i].backnumber});
                }
                ATK_Count.splice(0,MF_Num);
              }else{
                for(var i = 0; i < ATK_Count.length; i++){
                  MF_Arr.push({'id': ATK_Count[i].id, 'username': ATK_Count[i].username, 'backnumber': ATK_Count[i].backnumber});
                }
                MF_Num = MF_Num - ATK_Count.length;
                ATK_Count.splice(0, ATK_Count.length);

                if(DF_Count.length >= MF_Num){
                  for(var i = 0; i < MF_Num; i++){
                    MF_Arr.push({'id': DF_Count[i].id, 'username': DF_Count[i].username, 'backnumber': DF_Count[i].backnumber});
                  }
                  DF_Count.splice(0,MF_Num);
                }else{
                  for(var i = 0; i < DF_Count.length; i++){
                    MF_Arr.push({'id': DF_Count[i].id, 'username': DF_Count[i].username, 'backnumber': DF_Count[i].backnumber});
                  }
                  MF_Num = MF_Num - DF_Count.length;
                  DF_Count.splice(0, DF_Count.length);

                  if(GK_Count.length >= MF_Num){
                    for(var i = 0; i < MF_Num; i++){
                      MF_Arr.push({'id': GK_Count[i].id, 'username': GK_Count[i].username, 'backnumber': GK_Count[i].backnumber});
                    }
                    GK_Count.splice(0,MF_Num);
                  }else{
                    for(var i = 0; i < GK_Count.length; i++){
                      MF_Arr.push({'id': GK_Count[i].id, 'username': GK_Count[i].username, 'backnumber': GK_Count[i].backnumber});
                    }
                    MF_Num = MF_Num - GK_Count.length;
                    GK_Count.splice(0, GK_Count.length);
                  }
                }
              }
            }

            //DF선발
            if(DF_Count.length >= DF_Num){//희망개수보다 실제개수가 더 큰경우
              for(var i = 0; i < DF_Num; i++){
                DF_Arr.push({'id': DF_Count[i].id, 'username': DF_Count[i].username, 'backnumber': DF_Count[i].backnumber});
              }
              DF_Count.splice(0,DF_Num);
            }
            else{
              for(var i = 0; i < DF_Count.length; i++){
                DF_Arr.push({'id': DF_Count[i].id, 'username': DF_Count[i].username, 'backnumber': DF_Count[i].backnumber});
              }
              DF_Num = DF_Num - DF_Count.length;
              DF_Count.splice(0, DF_Count.length);

              if(MF_Count.length >= DF_Num){
                for(var i = 0; i < DF_Num; i++){
                  DF_Arr.push({'id': MF_Count[i].id, 'username': MF_Count[i].username, 'backnumber': MF_Count[i].backnumber});
                }
                MF_Count.splice(0,DF_Num);
              }else{
                for(var i = 0; i < MF_Count.length; i++){
                  DF_Arr.push({'id': MF_Count[i].id, 'username': MF_Count[i].username, 'backnumber': MF_Count[i].backnumber});
                }
                DF_Num = DF_Num - MF_Count.length;
                MF_Count.splice(0, MF_Count.length);

                if(ATK_Count.length >= DF_Num){
                  for(var i = 0; i < DF_Num; i++){
                    DF_Arr.push({'id': ATK_Count[i].id, 'username': ATK_Count[i].username, 'backnumber': ATK_Count[i].backnumber});
                  }
                  ATK_Count.splice(0,DF_Num);
                }else{
                  for(var i = 0; i < DF_Count.length; i++){
                    DF_Arr.push({'id': ATK_Count[i].id, 'username': ATK_Count[i].username, 'backnumber': ATK_Count[i].backnumber});
                  }
                  DF_Num = DF_Num - ATK_Count.length;
                  ATK_Count.splice(0, ATK_Count.length);

                  if(GK_Count.length >= DF_Num){
                    for(var i = 0; i < DF_Num; i++){
                      DF_Arr.push({'id': GK_Count[i].id, 'username': GK_Count[i].username, 'backnumber': GK_Count[i].backnumber});
                    }
                    GK_Count.splice(0,DF_Num);
                  }else{
                    for(var i = 0; i < GK_Count.length; i++){
                      DF_Arr.push({'id': GK_Count[i].id, 'username': GK_Count[i].username, 'backnumber': GK_Count[i].backnumber});
                    }
                    DF_Num = DF_Num - GK_Count.length;
                    GK_Count.splice(0, GK_Count.length);
                  }
                }
              }
            }

            for(var i in GK_Count) SUB_Arr.push({'id': GK_Count[i].id, 'username': GK_Count[i].username, 'backnumber': GK_Count[i].backnumber});
            for(var i in DF_Count) SUB_Arr.push({'id': DF_Count[i].id, 'username': DF_Count[i].username, 'backnumber': DF_Count[i].backnumber});
            for(var i in MF_Count) SUB_Arr.push({'id': MF_Count[i].id, 'username': MF_Count[i].username, 'backnumber': MF_Count[i].backnumber});
            for(var i in ATK_Count) SUB_Arr.push({'id': ATK_Count[i].id, 'username': ATK_Count[i].username, 'backnumber': ATK_Count[i].backnumber});
            res.status(200).send({
              'response':{
                'ATK': ATK_Arr,
                'MF': MF_Arr,
                'DF': DF_Arr,
                'GK': GK_Arr,
                'SUB':SUB_Arr
              }
            });
          }
        }
        conn.release();
      });
    }
  });
});

router.post('/:schedule_id/report', function(req, res, next){ // 성공
  var player = req.body.player;
  pool.getConnection(function(err, conn){
    if(err){
      console.log('getConnectionError: ', err);
      res.status(501).send({
        'message': 'Get Connection Error'
      });
    }
    else{
      console.log(req.body);
      var schedule_id = req.params.schedule_id;
      var player = req.body.player;
      var i_cnt = Object.keys(player).length;
      for(var position in player){
        if(player[position].length==0) i_cnt--;
      }
      for(var position in player){
        let query1 = 'Update attendee set position=? where schedule_id=? and player_id in (';
        var player_list = player[position];
        if(player_list.length > 0){
          var placehold = [position, schedule_id];
          for(var i=0; i<player_list.length; i++){
            if(i==0) query1 = query1 + '?';
            else query1 = query1 + ', ?';
            placehold.push(player_list[i].player_id);
          }
          query1 = query1 + ')';
          conn.query(query1, placehold, function(err){
            if(err){
              console.log('queryError: ', err);
              res.status(501).send({
                'message': 'Update Query Error'
              });
            }
            else if(--i_cnt == 0){
              let query2 = 'Insert into event (schedule_id, type, player_id, player_id2) values (?, ?, ?, ?)';
              var event = req.body.event;
              var j_cnt = event.length;
              var score = 0, score_against = 0;
              for(var j=0; j<event.length; j++){
                if(event[j].type=='score'){
                  let query3 = 'Update player set score=score+1 where id=?';
                  conn.query(query3, [event[j].player_id], function(err){
                    if(err){
                      console.log('queryError: ', err);
                      res.status(501).send({
                        'message': 'Update Query Error'
                      });
                    }
                  });
                  score++;
                }
                else if(event[j].type=='assist'){
                  let query3 = 'Update player set assist=assist+1 where id=?';
                  conn.query(query3, [event[j].player_id], function(err){
                    if(err){
                      console.log('queryError: ', err);
                      res.status(501).send({
                        'message': 'Update Query Error'
                      });
                    }
                  });
                  score++;
                }
                else if(event[j].type=='score_against') score_against++;
                conn.query(query2, [schedule_id, event[j].type, event[j].player_id, event[j].player_id2], function(err){
                  if(err){
                    console.log('queryError: ', err);
                    res.status(501).send({
                      'message': 'Insert Query Error'
                    });
                  }
                  else if(--j_cnt == 0){
                    var result = score>score_against?'win':score==score_against?'draw':'lose';
                    let query3 = 'Update player p inner join attendee a on p.id=a.player_id set p.score_against=p.score_against+?, p.total_game=p.total_game+1, p.' + result + '_game=p.' + result + '_game+1 where a.schedule_id=? and a.attendance=\'attend\'';
                    conn.query(query3, [score_against, schedule_id], function(err){
                      if(err){
                        console.log('queryError: ', err);
                        res.status(501).send({
                          'message': 'Update Query Error'
                        });
                      }
                      else{
                        let query4 = 'Update team t inner join schedule s on s.team_id=t.id set t.total_game=t.total_game+1, t.' + result + '_game=t.' + result + '_game+1, total_score=total_score+?, total_score_against=total_score_against+? where s.id=?';
                        conn.query(query4, [schedule_id, score, score_against], function(err){
                          if(err){
                            console.log('queryError', err);
                            res.status(501).send({
                              'message': 'Update Query Error'
                            });
                          }
                          else{
                            var tactic = req.body.tactic;
                            let query = 'Update schedule set tactic=?, score_team=?, score_against_team=? where id=?';
                            conn.query(query, [tactic, score, score_against, schedule_id], function(err){
                              if(err){
                                console.log('queryError: ', err);
                                res.status(501).send({
                                  'message': 'Update Query Error'
                                });
                              }
                              else{
                                res.status(200).send({
                                  'message': 'Insert report success'
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
            }
          });
        }
      }
      conn.release();
    }
  });
});

router.get('/:schedule_id/report', function(req, res, next){ //성공
  pool.getConnection(function(err, conn){
    if(err){
      console.log('getConnectionError: ', err);
      res.status(501).send({
        'message': 'Get Connection Error'
      });
    }
    else{
      var schedule_id = req.params.schedule_id;
      let query = 'Select tactic from schedule where id=?'
      conn.query(query, [schedule_id], function(err, data){
        if(err){
          console.log('queryError: ', err);
          res.status(501).send({
            'message': 'Select Query Error'
          });
        }
        else{
          let query2 = 'Select a.player_id, a.position, p.username, p.backnumber from attendee a, player p where a.schedule_id=? and a.attendance=\'attend\' and a.player_id=p.id order by a.position';
          conn.query(query2, [schedule_id], function(err, data2){
            if(err){
              console.log('queryError: ', err);
              res.status(501).send({
                'message': 'Select Query Error'
              });
            }
            else{
              var end={'ATK':0, 'DF':0, 'GK':0, 'MF':0, 'SUB':0}
              for(var i=0;i<data2.length;i++){
                end[data2[i].position] = i;
              }
              let query3 = 'Select type, player_id, player_id2 from event where schedule_id=?';
              conn.query(query3, [schedule_id], function(err, data3){
                if(err){
                  console.log('queryError: ', err);
                  res.status(501).send({
                    'message': 'Select Query Error'
                  });
                }
                else{
                  res.status(200).send({
                    'response':{
                      'tactic': data[0].tactic,
                      'player': {
                        'ATK': data2.slice(0, end.ATK+1),
                        'DF': data2.slice(end.ATK+1, end.DF+1),
                        'GK': data2.slice(end.DF+1, end.GK+1),
                        'MF': data2.slice(end.GK+1, end.MF+1),
                        'SUB': data2.slice(end.MF+1, end.SUB+1)
                      },
                      'event': data3
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
