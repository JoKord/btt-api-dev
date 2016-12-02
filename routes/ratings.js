'use strict';
let express = require('express');
let router = express.Router();
let db_ratings = require('../db/dbCon/ratings');

router.get('/', db_ratings.find, (req, res) => {
	res.status(200).json(res.locals.data);
});
router.get('/:id', db_ratings.findOne, (req, res) => {
	res.status(200).json(res.locals.data);
});
router.post('/', db_ratings.save, (req, res) => {
	res.status(201).location(req.baseUrl+req.path+"/"+res.locals.data.id_rating).json(res.locals.data);
});
router.put('/:id', db_ratings.update, (req, res) => {
	res.status(200).json(res.locals.data);
});
router.delete('/:id', db_ratings.remove, (req, res) => {
	res.sendStatus(204);
});
module.exports = router;