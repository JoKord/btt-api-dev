'use strict';
let db = require('../').db;
module.exports = {
	find: (req, res, next) => {
		db.utilizadores.find().then(data => {
			res.locals.data = data;
			return next();
		}).catch(err => next(err));	
	}

};