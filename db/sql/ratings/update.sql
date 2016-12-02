-- Query for updating a Rating
UPDATE ${schema~}.ratings
SET 
n_estrelas = ${n_estrelas}, 
comentario = ${comentario}, 
ultima_alteracao = now()
WHERE id_rating = ${id_rating}
RETURNING *;