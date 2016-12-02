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
	save: (req, res, next) => {
		db.ratings.save(req.body).then(data => {
			res.locals.data = data;
			return next();
		}).catch(err => next(err));
	},
	update: (req, res, next) => {
		db.ratings.update(req.body).then(data => {
			res.locals.data = data;
			return next();
		}).catch(err => next(err));
	},
	remove: (req, res, next) => {
		db.ratings.remove({id_rating:req.params.id}).then(data => next()).catch(err => next(err));
	}
};