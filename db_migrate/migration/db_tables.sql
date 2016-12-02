\echo ' -- INSERTING TABLES -- '
-- DROP TABLE PERCURSOS
CREATE TABLE percursos (
    id_percurso integer NOT NULL,
    cod_percurso character varying(20) NOT NULL,
    geom public.geometry(LineString,4326),
    nome character varying(128) NOT NULL,
    descricao text,
    data_criacao date DEFAULT now() NOT NULL,
    id_utilizador integer NOT NULL,
    rating_medio real DEFAULT 0.0 NOT NULL,
    comprimento_real real NOT NULL, 
    comprimento_st character varying(55) NOT NULL, 
    tempo_estimado_real real NOT NULL,
    tempo_estimado_st character varying(55) NOT NULL
);
ALTER TABLE percursos OWNER TO :owner;

-- CREATE PERCURSOS SEQUENCE
CREATE SEQUENCE percursos_id_percurso_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE percursos_id_percurso_seq OWNER TO :owner;
ALTER SEQUENCE percursos_id_percurso_seq OWNED BY percursos.id_percurso;

-- CREATE TABLE RATINGS
CREATE TABLE ratings (
    id_rating integer NOT NULL,
    n_estrelas integer DEFAULT 0 NOT NULL,
    comentario text NOT NULL,
    id_utilizador integer NOT NULL,
    id_percurso integer NOT NULL,
    data_insercao date DEFAULT now() NOT NULL,
    ultima_alteracao date DEFAULT now() NOT NULL,
    CONSTRAINT "CHK_Ratings_n_estrelas" CHECK (((n_estrelas >= 0) AND (n_estrelas <= 5)))
);
ALTER TABLE ratings OWNER TO :owner;
-- CREATE RATINGS SEQUENCE
CREATE SEQUENCE ratings_id_rating_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE ratings_id_rating_seq OWNER TO :owner;
ALTER SEQUENCE ratings_id_rating_seq OWNED BY ratings.id_rating;

-- CREATE TABLE UTILIZADORES
CREATE TABLE utilizadores (
    id_utilizador integer NOT NULL,
    username character varying(45) NOT NULL,
    password character varying(56) NOT NULL,
    email character varying(100) NOT NULL,
    data_criacao date DEFAULT now() NOT NULL
);
ALTER TABLE utilizadores OWNER TO :owner;
-- CREATE UTILIZADORES SEQUENCE
CREATE SEQUENCE utilizadores_id_utilizador_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE utilizadores_id_utilizador_seq OWNER TO :owner;
ALTER SEQUENCE utilizadores_id_utilizador_seq OWNED BY utilizadores.id_utilizador;

-- SET DEFAULT VALUE FOR PERCURSOS ID
ALTER TABLE ONLY percursos ALTER COLUMN id_percurso SET DEFAULT nextval('percursos_id_percurso_seq'::regclass);
-- SET DEFAULT VALUE FOR RATINGS ID
ALTER TABLE ONLY ratings ALTER COLUMN id_rating SET DEFAULT nextval('ratings_id_rating_seq'::regclass);
-- SET DEFAULT VALUE FOR UTILIZADORES ID
ALTER TABLE ONLY utilizadores ALTER COLUMN id_utilizador SET DEFAULT nextval('utilizadores_id_utilizador_seq'::regclass);

COPY percursos (id_percurso, nome, descricao, id_utilizador, rating_medio) FROM stdin;
\.
SELECT pg_catalog.setval('percursos_id_percurso_seq', 1, false);

COPY ratings (id_rating, n_estrelas, comentario, id_utilizador, id_percurso) FROM stdin;
\.
SELECT pg_catalog.setval('ratings_id_rating_seq', 1, false);

COPY utilizadores (id_utilizador, username, password, email, data_criacao) FROM stdin;
\.
SELECT pg_catalog.setval('utilizadores_id_utilizador_seq', 1, false);

\echo ' -- DONE INSERTING TABLES -- '

\echo ' -- PRINTING TABLES -- '
\dt