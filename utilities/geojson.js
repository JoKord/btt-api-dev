'use strict';
const gj = require('geojson');
const gjval = require('geojson-validation');
module.exports = {
	parseGeoJSON: (req, res, next) => {
		let geoJSON = gj.parse(res.locals.data, {GeoJSON:'geom'});
		res.locals.data = geoJSON;
		next();
	},
	isLineString: (req, res, next) => {
		gjval.isGeoJSONObject(res.locals.data, function(valid, err){
			if(!valid) return next(err);
			for(let feature of res.locals.data.features){
				gjval.isLineString(feature.geometry, function(valid, err){
					if(!valid) return next(err);
				});	
			}
			return next();
		});
	} 	 
}