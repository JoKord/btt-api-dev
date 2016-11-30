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
		let user = req.body;
		let qObj = {username:user.username, email:user.email};
		qObj.password = passHash.generate(user.password);
		console.log("1quilodesabao");
		console.log(passHash.generate("1quilodesabao"));
		console.log("2quilosdesabao");
		console.log(passHash.generate("2quilosdesabao"));
		console.log("3quilosdesabao");
		console.log(passHash.generate("3quilosdesabao"));
		console.log("4quilosdesabao");
		console.log(passHash.generate("4quilosdesabao"));
		db.utilizadores.save(qObj).then(data => {
			res.locals.data = data;
			return next();
		}).catch(err => next(err));
	}

};