'use strict';
let express = require('express');
let router = express.Router();
let db_percursos = require('../db/dbCon/percursos');
let geojson = require('../utilities/geojson');

router.get('/', db_percursos.find, geojson.parseGeoJSON, geojson.isLineString, (req, res, next) => {
	res.status(200).json(res.locals.data);
});
router.get('/:cod', db_percursos.findOne, geojson.parseGeoJSON, geojson.isLineString, (req, res, next) => {
	res.status(200).json(res.locals.data);
});

module.exports = router;