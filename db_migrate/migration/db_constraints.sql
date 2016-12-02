\echo ' -- INSERTING TABLE CONSTRAINTS -- '

-- CONSTRAINTS - PRIMARY KEYS
ALTER TABLE ONLY percursos
    ADD CONSTRAINT "PK_Percursos" PRIMARY KEY (id_percurso);
ALTER TABLE ONLY ratings
    ADD CONSTRAINT "PK_Ratings" PRIMARY KEY (id_rating);
ALTER TABLE ONLY utilizadores
    ADD CONSTRAINT "PK_Utilizadores" PRIMARY KEY (id_utilizador);

-- CONSTRAINTS - UNIQUE
ALTER TABLE ONLY utilizadores
    ADD CONSTRAINT "UN_Utilizadores_email" UNIQUE (email);
ALTER TABLE ONLY utilizadores
    ADD CONSTRAINT "UN_Utilizadores_username" UNIQUE (username);

-- CONSTRAINTS - FOREIGN KEY
ALTER TABLE ONLY ratings
    ADD CONSTRAINT "FK_Ratings_id_percurso" FOREIGN KEY (id_percurso) REFERENCES percursos(id_percurso) ON DELETE CASCADE;
ALTER TABLE ONLY ratings
    ADD CONSTRAINT "FK_Ratings_id_utilizador" FOREIGN KEY (id_utilizador) REFERENCES utilizadores(id_utilizador) ON DELETE CASCADE;

\echo ' -- DONE INSERTING CONSTRAINTS -- '