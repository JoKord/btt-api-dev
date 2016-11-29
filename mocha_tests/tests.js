'use strict'
const assert = require('assert');
const supertest = require('supertest');
const request = supertest.agent("http://localhost:3000");
const gjVal = require('geojson-validation');

describe('Percursos EndPoints', function () {
	describe('GET / - Percursos', function() {
		it('Response Status 200', function(done){
			request.get("/api/percursos").expect(200, done);
		});
		it('Response Type JSON', function(done){
			request.get("/api/percursos").expect('Content-Type', /json/).expect(200, done);
		});
		it('Is GeoJSON and LineString', function(done){
			request.get("/api/percursos").expect(res => {
				assert(gjVal.isGeoJSONObject(res.body), 'Response is Not GeoJSON.');
				let features = res.body.features;
				for(let index in features){
					assert(gjVal.isLineString(features[index].geometry, 'Feature['+index+'] is not Valid.'));
				}
			}).expect(200, done);
		});
	});
	describe('GET /:cod - Percursos', function(){
		it('Response Status 200', function(done){
			request.get("/api/percursos/DNVEDVP7ER9I").expect(200, done);
		});
		it('Response Type JSON', function(done){
			request.get("/api/percursos/DNVEDVP7ER9I").expect('Content-Type', /json/).expect(200, done);
		});
		it('Is GeoJSON and LineString', function(done){
			request.get("/api/percursos/DNVEDVP7ER9I").expect(res => {
				assert(gjVal.isGeoJSONObject(res.body), 'Response is Not GeoJSON.');
				assert(gjVal.isLineString(res.body.geometry, 'Feature is not Valid.'));			
			}).expect(200, done);
		});
	});
});