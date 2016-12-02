\echo ' -- INSERTING TRIGGERS -- '
-- TRIGGERS
--DROP TRIGGER update_ratings_media ON ratings;
CREATE TRIGGER update_ratings_media
  AFTER INSERT OR UPDATE OR DELETE ON ratings
  FOR EACH ROW
  EXECUTE PROCEDURE update_ratings_media();
--DROP TRIGGER insert_comprimento_e_tempo ON percursos; 
CREATE TRIGGER calc_valores_percurso
  BEFORE INSERT OR UPDATE ON percursos
  FOR EACH ROW
  EXECUTE PROCEDURE calc_valores_percurso();