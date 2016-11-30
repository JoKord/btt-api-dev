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
router.post('/', db_utilizadores.save, (req, res) => {
	res.status(201).location(req.baseUrl+req.path+"/"+res.locals.data.id_utilizador).json(res.locals.data);
});
router.put('/:id', db_utilizadores.update, (req, res) => {
	res.status(200).json(res.locals.data);
});
router.delete('/:cod');

module.exports = router;