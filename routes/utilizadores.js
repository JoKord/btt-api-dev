'use strict';
let express = require('express');
let router = express.Router();
let db_utilizadores = require('../db/dbCon/utilizadores');

router.get('/', db_utilizadores.find, (req, res) => {
	res.status(200).json(res.locals.data);
});
router.get('/:id', db_utilizadores.findOne, (req, res) => {
	res.status(200).json(res.locals.data);
});
router.post('/');
router.put('/:cod');
router.delete('/:cod');

module.exports = router;