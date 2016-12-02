-- Query for adding a NEW Rating
INSERT INTO ${schema~}.ratings(n_estrelas, comentario, id_utilizador, id_percurso)
VALUES (${n_estrelas^}, ${comentario}, ${id_utilizador^}, ${id_percurso^})
RETURNING *;