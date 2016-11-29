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
	}
};