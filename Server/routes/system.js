const express = require('express');
const router = express.Router();
const aws = require('aws-sdk');
const s3 = new aws.S3()
aws.config.loadFromPath('./config/aws_config.json');
const pool = require('../config/db_pool');
const multer = require('multer');
const multerS3 = require('multer-s3');
const moment = require('moment');

router.get('/card', function(req, res, next){
  pool.getConnection(function(err, conn){
    if(err){
      console.log('getConnectionError: ', err);
      res.status(501).send({
        'message': 'Get Connection Error'
      });
    }
    else{
      let query = 'Update player set card_ATK=rand()*10+60, card_PAC=rand()*10+60, card_PHY=rand()*10+60, card_TEC=rand()*10+60, card_STA=rand()*10+60, card_DEF=rand()*10+60 where total_game>0';
      conn.query(query, function(err){
        if(err){
          console.log('queryError: ', err);
          res.status(501).send({
            'message': 'Update Query Error'
          });
        }
        else{
          let query1 = 'Update player set card_ATK=card_ATK+rand()*6+4, card_PAC=card_PAC+rand()*6+4, card_PHY=card_PHY+rand()*3+2, card_TEC=card_TEC+rand()*3+2 where position=\'ATK\' and total_game>0';
          conn.query(query1, function(err){
            if(err){
              console.log('queryError: ', err);
              res.status(501).send({
                'message': 'Update Query Error'
              });
            }
            else{
              let query2 = 'Update player set card_ATK=card_ATK+rand()*3+2, card_PAC=card_PAC+rand()*3+2, card_TEC=card_TEC+rand()*6+4, card_STA=card_STA+rand()*6+4 where position=\'MF\' and total_game>0';
              conn.query(query2, function(err){
                if(err){
                  console.log('queryError: ', err);
                  res.status(501).send({
                    'message': 'Update Query Error'
                  });
                }
                else{
                  let query3 = 'Update player set card_PHY=card_PHY+rand()*3+2, card_DEF=card_DEF+rand()*12+8, card_STA=card_STA+rand()*3+2, card_PAC=card_PAC+rand()*3+2 where (position=\'DF\' or position=\'GK\') and total_game>0';
                  conn.query(query3, function(err){
                    if(err){
                      console.log('queryError: ', err);
                      res.status(501).send({
                        'message': 'Update Query Error'
                      });
                    }
                    else{
                      let query4 = 'Update player set card_ATK=card_ATK+(score/total_game)*2, card_PAC=card_PAC+(score/total_game)*2, card_PHY=card_PHY+(score/total_game)*2, card_TEC=card_TEC+(score/total_game)*2 where position=\'ATK\' and total_game>0';
                      conn.query(query4, function(err){
                        if(err){
                          console.log('queryError: ', err);
                          res.status(501).send({
                            'message': 'Update Query Error'
                          });
                        }
                        else{
                          let query5 = 'Update player set card_ATK=card_ATK+((score+assist)/total_game), card_PAC=card_PAC+((score+assist)/total_game), card_TEC=card_TEC+((score+assist)/total_game), card_STA=card_STA+((score+assist)/total_game) where position=\'MF\' and total_game>0';
                          conn.query(query5, function(err){
                            if(err){
                              console.log('queryError: ', err);
                              res.status(501).send({
                                'message': 'Update Query Error'
                              });
                            }
                            else{
                              let query6 = 'Update player set card_DEF=card_DEF-score_against/total_game where (position=\'GK\' or position=\'DF\') and total_game>0';
                              conn.query(query6, function(err){
                                if(err){
                                  console.log('queryError: ', err);
                                  res.status(501).send({
                                    'message': 'Update Query Error'
                                  });
                                }
                                else{
                                  let query7 = 'Update player set card_total=(card_ATK+card_DEF+card_PAC+card_PHY+card_TEC+card_STA)/6';
                                  conn.query(query7, function(err){
                                    if(err){
                                      console.log('queryError: ', err);
                                      res.status(501).send({
                                        'message': 'Update Query Error'
                                      });
                                    }
                                    else{
                                      res.status(200).send({
                                        'message': 'Update Card status success'
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
    }
  });
});

router.get('/rank', function(req, res, next){
  pool.getConnection(function(err, conn){
    if(err){
      console.log('getConnectionError: ', err);
      res.status(501).send({
        'message': 'Get Connection Error'
      });
    }
    else{
      let query = 'Update team join (select t.id, @curRank := @curRank+1 as rank from team t join (select @curRank:=0) r order by t.win_game/t.total_game desc, t.total_game desc, t.draw_game desc) ranks on (ranks.id=team.id) set team.rank=ranks.rank';
      conn.query(query, function(err){
        if(err){
          console.log('queryError: ', err);
          res.status(501).send({
            'message': 'Update Query Error'
          });
        }
        else{
          res.status(200).send({
            'message': 'Update rank success'
          });
        }
      });
    }
  });
});

module.exports = router;
