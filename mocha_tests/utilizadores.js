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
		describe('GET /:id - Utilizadores', function(){
			it('Response Status 200', function(done){
				request.get("/api/utilizadores/1").expect(200, done);
			});
			it('Response Type JSON', function(done){
				request.get("/api/utilizadores/1").expect('Content-Type', /json/).expect(200, done);
			});
			it('Print The User', function(done){
				request.get("/api/utilizadores/1").expect(res => {console.log(res.body)}).expect(200,done);
			});
			it('Correct Result', function(done){
				request.get("/api/utilizadores/1").expect(res => {
					assert.deepEqual(res.body, 
						{ 
							id_utilizador: 1,
					    	username: 'User1',
					    	email: 'User1@gmail.com',
					    	data_criacao: '28 Nov 2016',
					    	percursos_criados: '4' 
				    	}, 'Utilizador não é o Correcto.'
				    );
				}).expect(200,done);
			});
		});
	});
}	