\echo ' -- INSERTING FUNCTIONS -- '
-- FUNCTIONS
CREATE OR REPLACE FUNCTION generate_code() returns text as 
$$
DECLARE
  chars text[] := '{0,1,2,3,4,5,6,7,8,9,A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z}';
  result text := '';
  i integer := 0;
  length integer := 12;
BEGIN
  FOR i in 1..length loop
    result := result || chars[1+random()*(array_length(chars, 1)-1)];
  END loop;
  RETURN result;
END;
$$ 
LANGUAGE PLPGSQL;
ALTER FUNCTION generate_code() SET search_path=:schema,public;

-- TRIGGER FUNCTIONS
CREATE OR REPLACE FUNCTION update_ratings_media()
  RETURNS trigger AS
$BODY$
  DECLARE
  id_do_percurso integer;
BEGIN
  IF (TG_OP = 'DELETE') THEN
    id_do_percurso = OLD.id_percurso;
  ELSE
    id_do_percurso = NEW.id_percurso;
  END IF; 
UPDATE percursos
SET rating_medio=subquery.average
FROM (SELECT AVG(n_estrelas) as average
      FROM ratings 
      WHERE id_percurso = id_do_percurso) AS subquery
WHERE percursos.id_percurso=id_do_percurso;
RETURN NULL;
END;
$BODY$
LANGUAGE PLPGSQL;
ALTER FUNCTION update_ratings_media() SET search_path=:schema,public;

CREATE OR REPLACE FUNCTION calc_valores_percurso()
  RETURNS trigger AS
$BODY$
DECLARE
  vel_media_em_km_h integer := 10;
  tempo_estimado_total real;
  tempo_estimado_h real;
  tempo_estimado_m real;
  comprimento real;
  comprimento_km real;
BEGIN
  IF (TG_OP = 'INSERT') THEN
    NEW.cod_percurso = generate_code();
  END IF;
  comprimento = (ST_Length(NEW.geom::geography));
  comprimento_km = (comprimento / 1000);
  NEW.comprimento_real = (comprimento_km);
  tempo_estimado_total = (comprimento_km / vel_media_em_km_h);
  tempo_estimado_h = (floor(tempo_estimado_total));
  tempo_estimado_m = (round(((tempo_estimado_total - tempo_estimado_h) * 60)));
  NEW.tempo_estimado_real = tempo_estimado_total;
  IF tempo_estimado_h <> 0 THEN
    NEW.tempo_estimado_st = tempo_estimado_h || ' Horas e ' || tempo_estimado_m || ' Minutos'; 
  ELSEIF tempo_estimado_m < 1 THEN
    NEW.tempo_estimado_st = 1 || ' Minuto';
  ELSE
    NEW.tempo_estimado_st = tempo_estimado_m || ' Minutos';   
  END IF;
  IF comprimento_km < 1 THEN
    NEW.comprimento_st = round(comprimento) || ' Metros';
  ELSE
    NEW.comprimento_st = round(comprimento_km::numeric, 2) || ' Km';
  END IF;
RETURN NEW;
END;
$BODY$
LANGUAGE PLPGSQL;
ALTER FUNCTION calc_valores_percurso() SET search_path=:schema,public;

\echo ' -- DONE INSERTING FUNCTIONS -- '