'use strict';
const assert = require('assert');
const supertest = require('supertest');
const request = supertest.agent("http://localhost:3000");

let RatingsTests = module.exports = () => {
	describe('Ratings EndPoints', function () {
		describe('GET / - Ratings', function () {
			it('Response Status 200', function(done){
				request.get("/api/ratings").expect(200, done);
			});
			it('Response Type JSON', function(done){
				request.get("/api/ratings").expect('Content-Type', /json/).expect(200, done);
			});
			it('Print The Ratings', function(done){
				request.get("/api/ratings").expect(res => {console.log(res.body)}).expect(200,done);
			});
		});
	});
}	