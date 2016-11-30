-- Query For Utilizadores by id_utilizador
SELECT * FROM 
${schema~}.utilizadores_all
WHERE id_utilizador = ${id^};