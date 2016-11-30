'use strict'
const express = require('express');
const path = require('path');
const favicon = require('serve-favicon');
const logger = require('morgan');
const cookieParser = require('cookie-parser');
const bodyParser = require('body-parser');

const app = express();

// uncomment after placing your favicon in /public
app.use(logger('dev'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

// Postgres Promise Pacakage
const pgp = require('./db').pgp;
const QueryResultError = pgp.errors.QueryResultError;
const qrec = pgp.errors.queryResultErrorCode;

const index = require('./routes/index');
const percursos = require('./routes/percursos');
const utilizadores = require('./routes/utilizadores');

app.use('/', index);
app.use('/api/percursos', percursos);
app.use('/api/utilizadores', utilizadores);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  var err = new Error('Not Found');
  err.status = 404;
  next(err);
});

// error handlers
// development error handler
// will print stacktrace
if (app.get('env') === 'development') {
  app.use(function(err, req, res, next) {
    if(err instanceof QueryResultError){
      console.log(err);
      if(err.code == qrec.noData){
        res.status(500);
        res.render('error', {
          message: "Nao foi devolvido nada.",
          error: "QREC.noData"
        });
      }
    } else{
      console.log(err);
      res.status(err.status || 500).json(err);  
    }
  });
}

module.exports = app;