'use strict';
const db = require('../').db;
const passHash = require('password-hash');
module.exports = {
	find: (req, res, next) => {
		db.utilizadores.find().then(data => {
			res.locals.data = data;
			return next();
		}).catch(err => next(err));	
	},
	findOne: (req, res, next) => {
		db.utilizadores.findOne({id:req.params.id}).then(data => {
			res.locals.data = data;
			return next();
		}).catch(err =>  next(err));
	},
	save: (req, res, next) => {
		db.utilizadores.save(_getUser(req.body, null)).then(data => {
			res.locals.data = data;
			return next();
		}).catch(err => next(err));
	},
	update: (req, res, next) => {
		db.utilizadores.update(_getUser(req.body, req.params.id)).then(data => {
			res.locals.data = data;
			return next();
		}).catch(err => next(err));
	}

};

function _getUser(data, id){
	let user = {username: data.username, email: data.email};
	user.id_utilizador = id || 0;
	user.password = passHash.generate(data.password);
	return user;
};