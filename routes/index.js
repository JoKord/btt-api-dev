var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'BTT-Gistree (Dev)', message: 'Welcome to BTT-Gistree (In Dev)'});
});

module.exports = router;
