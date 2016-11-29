-- Query for updating a Percurso
UPDATE ${schema~}.percursos
SET 
geom = (ST_SetSRID(ST_GeomFromGeoJSON(${geometry}),4326)), 
nome = ${nome}, 
descricao = ${descricao}, 
id_utilizador = ${id_utilizador}
WHERE cod_percurso = ${cod_percurso}
RETURNING 
cod_percurso, 
st_asgeojson(geom)::json AS geom, 
nome AS nome_percurso, 
descricao,
comprimento_st AS comprimento,
tempo_estimado_st AS duracao;