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
					res.body.data_insercao = "DATE()";
					res.body.ultima_alteracao = "DATE()"
					assert.deepEqual(res.body, 
						{ 
							"id_rating": 1,
							"cod_percurso": "DNVEDVP7ER9I",
        					"comentario": "Excelente!",
        					"criado_por": "User1",
        					"data_insercao": "DATE()",
        					"ultima_alteracao": "DATE()",
        					"n_estrelas": 5,
        					"nome_percurso": "PercurosoTeste1"
				    	}, 'Rating não é o Correcto.'
				    );
				}).expect(200,done);
			});
		});
		let rating = {
			"id_utilizador": 1,
			"id_percurso": 4,
			"comentario": "Meh!",
			"n_estrelas": 3
		};
		describe('POST / - Ratings', function(){		
			it('Return Location and Resource', function(done){
				request.post("/api/ratings").send(rating)
					.expect('Location', /\/api\/ratings\/[0-9]*/)
					.expect(res => {
						rating.id_rating = res.body.id_rating;
						rating.data_insercao = res.body.data_insercao;
						rating.ultima_alteracao = res.body.ultima_alteracao;
						console.log("..:: Returned Rating ::..")
						console.log(res.body);
						assert.deepEqual(rating, res.body, 'Rating foi criado incorrectamente.');
					}).expect(201, done);
			});	
		});	
		describe('PUT /:id - Ratings', function(){
			it('Update the Resource', function(done){
				rating.n_estrelas = 4;
				rating.comentario = "Meh!++";
				request.put("/api/ratings/"+rating.id_rating).send(rating)
					.expect(res => {
						assert.deepEqual(res.body, rating);
						console.log("..:: Updated Rating ::..")
						console.log(res.body);
					}).expect(200,done);
			});
		});	
		describe('DELETE /:id - Ratings', function(){
			it('Delete a Resource Specified, Status 204', function(done){
				request.del("/api/ratings/"+rating.id_rating).expect(204, done);
			});
		});
	});
}	