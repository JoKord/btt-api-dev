'use strict';
let db = require('../').db;
module.exports = {
	find: (req, res, next) => {
		db.percursos.find().then(data => {
			res.locals.data = data;
			return next();
		}).catch(err => next(err));	
	},
	findOne: (req, res, next) => {
		db.percursos.findOne({cod_percurso:req.params.cod}).then(data => {
			res.locals.data = data;
			return next();
		}).catch(err => next(err));
	},
	save: (req, res, next) => {
		let qObj = req.body.properties;
		qObj.geometry = req.body.geometry;
		db.percursos.save(qObj).then(data => {
			res.locals.data = data;
			return next();
		}).catch(err => next(err));
	},
	update: (req, res, next) => {
		let qObj = req.body.properties;
		qObj.geometry = req.body.geometry;
		qObj.cod_percurso = req.params.cod;
		db.percursos.update(qObj).then(data => {
			res.locals.data = data;
			return next();
		}).catch(err => next(err));
	},
	remove: (req, res, next) => {
		db.percursos.remove({cod_percurso:req.params.cod}).then(data => next()).catch(err => next(err));
	}
};