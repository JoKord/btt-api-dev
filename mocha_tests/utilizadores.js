'use strict';
const assert = require('assert');
const supertest = require('supertest');
const request = supertest.agent("http://localhost:3000");

let UtilizadoresTests = module.exports = () => {
	describe('Percursos EndPoints', function () {
		let newUtilizador = {
			username: 'NewUser',
			password: 'HelloDarkness',
			email: '10gramasdefiambre@comidas.pt'
		};
		let utilizador = { 
			id_utilizador: 1,
			username: 'User1',
			email: 'User1@gmail.com',
			data_criacao: 'DATE()',
			percursos_criados: '2',
			ultima_alteracao: 'DATE()'
		};
		describe('GET / - Utilizadores', function () {
			it('Response Status 200', function(done){
				request.get("/api/utilizadores").expect(200, done);
			});
			it('Response Type JSON', function(done){
				request.get("/api/utilizadores").expect('Content-Type', /json/).expect(200, done);
			});
			it('Print The Users', function(done){
				request.get("/api/utilizadores").expect(res => {
					//console.log(res.body);
				}).expect(200,done);
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
				request.get("/api/utilizadores/1").expect(res => {
					//console.log(res.body);
				}).expect(200,done);
			});
			it('Correct Result', function(done){
				request.get("/api/utilizadores/1").expect(res => {
					utilizador.data_criacao = res.body.data_criacao;
					utilizador.ultima_alteracao = res.body.ultima_alteracao;
					assert.deepEqual(res.body, 
						utilizador, 'Utilizador não é o Correcto.'
				    );
				}).expect(200,done);
			});
		});
		describe('POST / - Utilizadores', function(){		
			it('Return Location and Resource', function(done){
				request.post("/api/utilizadores").send(newUtilizador)
					.expect('Location', /\/api\/utilizadores\/[0-9]*/)
					.expect(res => {
						delete newUtilizador.password;
						newUtilizador.id_utilizador = res.body.id_utilizador;
						//console.log("..:: Returned Utilizador ::..")
						//console.log(res.body);
						assert.deepEqual(newUtilizador, res.body, 'Utilizador foi criado incorrectamente.');
					}).expect(201, done);
			});	
		});
		describe('PUT /:id - Utilizadores', function(){
			it('Update the Resource', function(done){
				newUtilizador.password = "NovaPassword";
				newUtilizador.email = "20gramasdequeijo@comida.com";
				request.put("/api/utilizadores/"+newUtilizador.id_utilizador).send(newUtilizador)
					.expect(res => {
						delete newUtilizador.password;
						assert.deepEqual(res.body, newUtilizador);
						//console.log("..:: Updated Utilizador ::..")
						//console.log(res.body);
					}).expect(200,done);
			});
		});
		describe('DELETE /:id - Utilizadores', function(){
			it('Delete a Resource Specified, Status 204', function(done){
				request.del("/api/utilizadores/"+newUtilizador.id_utilizador).expect(204, done);
			});
		});
	});
}	