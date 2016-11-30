'use strict';
const assert = require('assert');
const supertest = require('supertest');
const request = supertest.agent("http://localhost:3000");

var UtilizadoresTests = module.exports = () => {
	describe('Percursos EndPoints', function () {
		describe('GET / - Utilizadores', function () {
			it('Response Status 200', function(done){
				request.get("/api/utilizadores").expect(200, done);
			});
			it('Response Type JSON', function(done){
				request.get("/api/utilizadores").expect('Content-Type', /json/).expect(200, done);
			});
			it('Print The Users', function(done){
				request.get("/api/utilizadores").expect(res => {console.log(res.body)}).expect(200,done);
			});
		});
	});
}	