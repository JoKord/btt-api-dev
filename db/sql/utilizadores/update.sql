-- Query for updating a Percurso
UPDATE ${schema~}.utilizadores
SET 
username = ${username}, 
password = ${password}, 
email = ${email}
WHERE id_utilizador = ${id_utilizador}
RETURNING 
id_utilizador,
username, 
email;