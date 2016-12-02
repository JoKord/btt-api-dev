\echo ' -- INSERTING VIEWS -- '
-- VIEWS
--DROP VIEW IF EXISTS dev.percursos_best;
CREATE OR REPLACE VIEW percursos_best 
AS 
SELECT 
per.id_percurso as id_percurso, 
per.cod_percurso as cod_percurso,
per.nome as nome_percurso, 
per.descricao as descricao_percurso, 
per.rating_medio as rating,
per.comprimento_st as comprimento,
per.tempo_estimado_st as duracao_estimada,
per.data_criacao as criado_a, 
ut.username as criado_por  
FROM :schema.percursos per
INNER JOIN :schema.utilizadores ut 
ON ut.id_utilizador = per.id_utilizador
ORDER BY rating_medio DESC;

CREATE OR REPLACE VIEW percursos_all 
AS
SELECT 
cod_percurso, 
ST_asgeojson(geom)::json as geom, 
nome as nome_percurso, 
descricao, 
rating_medio as rating,
comprimento_st as comprimento,
tempo_estimado_st as duracao,
u.username as criado_por 
FROM :schema.percursos p 
INNER JOIN :schema.utilizadores u 
ON u.id_utilizador = p.id_utilizador;

CREATE OR REPLACE VIEW utilizadores_all
AS 
SELECT 
u.id_utilizador,
u.username,
u.email,
to_char(u.data_criacao, 'DD Mon YYYY') as data_criacao,
(SELECT count(*) 
	FROM :schema.percursos
	WHERE id_utilizador = u.id_utilizador
) as percursos_criados
FROM
:schema.utilizadores u;

CREATE OR REPLACE VIEW ratings_all
AS
SELECT
r.id_rating,
r.n_estrelas,
r.comentario,
r.data_insercao,
r.ultima_alteracao,
u.username as criado_por,
p.cod_percurso,
p.nome as nome_percurso
FROM :schema.ratings r
INNER JOIN :schema.utilizadores u ON u.id_utilizador = r.id_utilizador
INNER JOIN :schema.percursos p ON p.id_percurso = r.id_percurso; 

\echo ' -- DONE INSERTING VIEWS -- '