-- Query for adding a NEW Percurso
INSERT INTO ${schema~}.percursos(geom, nome, descricao, id_utilizador)
VALUES (ST_SetSRID(ST_GeomFromGeoJSON(${geometry}),4326),${nome},${descricao},${id_utilizador})
RETURNING 
cod_percurso, 
st_asgeojson(geom)::json AS geom, 
nome AS nome_percurso, 
descricao,
comprimento_st AS comprimento,
tempo_estimado_st AS duracao;