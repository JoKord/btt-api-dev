-- Database version 9.5.5
\echo `date`

\set databasename 'btt_dev'
\set schema 'dev'
\set owner 'postgres'

-- VARIABLE DEFINITION
--\prompt "Database Name:" databasename
--\prompt "Schema Name:" schema

-- CREATE DATABASE
CREATE DATABASE :databasename
  WITH OWNER = :owner
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       LC_COLLATE = 'en_US.UTF-8'
       LC_CTYPE = 'en_US.UTF-8'
       CONNECTION LIMIT = -1;

-- CONNECT TO DATABASE
\connect :databasename
\conninfo

-- DATABASE DEFAULTS
SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

-- ADD EXTENSION POSTGIS
CREATE EXTENSION postgis;

-- CREATE SCHEMA DEV
CREATE SCHEMA :schema;
ALTER SCHEMA :schema OWNER TO :owner;
SET search_path = :schema, 'public', pg_catalog;
SET default_tablespace = '';
SET default_with_oids = false;

-- TABLE INSERT
\i db_tables.sql
-- CONSTRAINT INSERT
\i db_constraints.sql
-- FUNCTION INSERT
\i db_functions.sql
-- TRIGGER INSERT
\i db_triggers.sql
-- VIEW INSERT
\i db_views.sql
-- DUMMY DATA INSERT 
\i db_dummy_data.sql    

\echo ' ------------------ '
\echo ' ----> JoKord <---- '
\echo ' ------------------ '