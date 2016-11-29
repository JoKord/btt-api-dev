'use strict'
const assert = require('assert');
const supertest = require('supertest');
const request = supertest.agent("http://localhost:3000");
const gjVal = require('geojson-validation');

describe('Percursos EndPoints', function () {
	let cod_percurso;
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
	describe('POST / - Percursos', function() {
		let percurso = {
			type: 'Feature',
  			geometry: 
   				{ 
   					type: 'LineString',
     				coordinates: [	
						[-7.74401324200568, 41.2961235262365],
						[-7.74384896858675, 41.2970011741126],
						[-7.74359343215729, 41.2973302890216],
						[-7.74257128643948, 41.297645689251],
						[-7.74165865633429, 41.2980159397482],
						[-7.74161986955482, 41.2980313668066],
						[-7.74194385324216, 41.2981205008506],
						[-7.74256444171369, 41.2983296225525],
						[-7.74265114157369, 41.2983639047348],
						[-7.74236366309055, 41.2986210205273],
						[-7.74199861104847, 41.298980980934],
						[-7.74184346393059, 41.2992552351485],
						[-7.74178870612428, 41.2994129307996],
						[-7.74199861104847, 41.2994129307996],
						[-7.74242754719791, 41.2990426882328],
						[-7.74280172554104, 41.2988095714643],
						[-7.7430755145726, 41.2986175923234],
						[-7.74358658743151, 41.2987478639449],
						[-7.74371663722151, 41.2987581485355],
						[-7.7438649396136, 41.2987410075502],
						[-7.74404518405938, 41.2987221524613]
						]
     			},
  			properties: 
   				{ 
   					nome: 'PercurosoTeste1',
     				descricao: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, \n\tsed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\n\tUt enim ad minim veniam, quis nostrud exercitation ullamco laboris \n\tnisi ut aliquip ex ea commodo consequat. \n\tDuis aute irure dolor in reprehenderit in voluptate velit esse cillum \n\tdolore eu fugiat nulla pariatur. \n\tExcepteur sint occaecat cupidatat non proident, sunt in culpa qui \n\tofficia deserunt mollit anim id est laborum.',
     				id_utilizador: 1 // TODO - Automático
     			} 
     		};
		it('Return Location and Resource as GeoJSON', function(done){
			request.post("/api/percursos").send(percurso)
				.expect('Location', /\/api\/percursos\/[A-Z0-9]*/)
				.expect(res => {
					assert(gjVal.isGeoJSONObject(res.body), 'Response is Not GeoJSON.');
					assert(gjVal.isLineString(res.body.geometry, 'Feature is not Valid.'));	
					cod_percurso = res.body.properties.cod_percurso;
					console.log("..:: Returned Percurso ::..")
					console.log(res.body);
				}).expect(201, done);
		});	
	});
	describe('DELETE /percursos/:cod', function () {
		it('Delete a Resource Specified, Status 204', function(done){
			request.del("/api/percursos/"+cod_percurso).expect(204, done);
		});
	})
});