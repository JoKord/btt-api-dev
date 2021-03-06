'use strict';
let express = require('express');
let router = express.Router();
let db_percursos = require('../db/dbCon/percursos');
let geojson = require('../utilities/geojson');

router.get('/', db_percursos.find, geojson.parseGeoJSON, geojson.isLineString, (req, res) => {
	res.status(200).json(res.locals.data);
});
router.get('/:cod', db_percursos.findOne, geojson.parseGeoJSON, geojson.isLineString, (req, res) => {
	res.status(200).json(res.locals.data);
});
router.post('/', geojson.isLineString, db_percursos.save, geojson.parseGeoJSON, (req, res) => {
	res.status(201).location(req.baseUrl+req.path+"/"+res.locals.data.properties.cod_percurso).json(res.locals.data);
});
router.put('/:cod', geojson.isLineString, db_percursos.update, geojson.parseGeoJSON, (req, res) => {
	res.status(200).json(res.locals.data);
});
router.delete('/:cod', db_percursos.remove, (req, res) => {
	res.sendStatus(204);
})
module.exports = router;