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
		let data = res.locals.data || req.body;
		gjval.isGeoJSONObject(data, function(valid, err){
			if(!valid) return next(err);
			if(data.hasOwnProperty('features')){
				for(let feature of data.features){
					gjval.isLineString(feature.geometry, function(valid, err){
						if(!valid) return next(err);
					});	
				}
			}else{
				gjval.isLineString(data.geometry, function(valid, err){
					if(!valid) return next(err);
				});
			}
			return next();
		});
	} 	 
}