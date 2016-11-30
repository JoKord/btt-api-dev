-- Query for adding a NEW Utilizador
INSERT INTO ${schema~}.utilizadores(username, password, email)
VALUES (${username}, ${password}, ${email})
RETURNING 
id_utilizador, 
username, 
email;