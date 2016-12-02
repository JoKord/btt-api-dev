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
		describe('GET /:id - Ratings', function () {
			it('Response Status 200', function(done){
				request.get("/api/ratings/1").expect(200, done);
			});
			it('Response Type JSON', function(done){
				request.get("/api/ratings/1").expect('Content-Type', /json/).expect(200, done);
			});
			it('Print The Rating', function(done){
				request.get("/api/ratings/1").expect(res => {console.log(res.body)}).expect(200,done);
			});
			it('Correct Result', function(done){
				request.get("/api/ratings/1").expect(res => {
					res.body.cod_percurso = "DNVEDVP7ER9I";
					res.body.data_insercao = "2016-11-28T00:00:00.000Z";
					assert.deepEqual(res.body, 
						{ 
							"id_rating": 1,
							"cod_percurso": "DNVEDVP7ER9I",
        					"comentario": "Excelente!",
        					"criado_por": "User1",
        					"data_insercao": "2016-11-28T00:00:00.000Z",
        					"n_estrelas": 5,
        					"nome_percurso": "PercurosoTeste1"
				    	}, 'Rating não é o Correcto.'
				    );
				}).expect(200,done);
			});
		});
	});
}	