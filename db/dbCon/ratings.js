'use strict';
let db = require('../').db;
module.exports = {
	find: (req, res, next) => {
		db.ratings.find().then(data => {
			res.locals.data = data;
			return next();
		}).catch(err => next(err));	
	},
	findOne: (req, res, next) => {
		db.ratings.findOne({id_rating:req.params.id}).then(data => {
			res.locals.data = data;
			return next();
		}).catch(err => next(err));
	},
	/*
	save: (req, res, next) => {
		let qObj = req.body.properties;
		qObj.geometry = req.body.geometry;
		db.ratings.save(qObj).then(data => {
			res.locals.data = data;
			return next();
		}).catch(err => next(err));
	},
	update: (req, res, next) => {
		let qObj = req.body.properties;
		qObj.geometry = req.body.geometry;
		qObj.cod_percurso = req.params.cod;
		db.ratings.update(qObj).then(data => {
			res.locals.data = data;
			return next();
		}).catch(err => next(err));
	},
	remove: (req, res, next) => {
		db.ratings.remove({cod_percurso:req.params.cod}).then(data => next()).catch(err => next(err));
	}*/
};