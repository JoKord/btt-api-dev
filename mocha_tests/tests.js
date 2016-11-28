'use strict'
let assert = require('assert');
let supertest = require('supertest');
let request = supertest.agent("http://localhost:3000");

describe('Percursos EndPoints', function () {
	describe('GET / - Percursos', function() {
		it('Response Status 200', function(done){
			request.get("/api/percursos").expect(200, done);
		});
		/*it('Response Type JSON', function(done){
			request.get("/api/percursos").expect('Content-Type', /json/).expect(200, done);
		});
		it('Is GeoJSON and LineString');*/
	});
});