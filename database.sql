SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

CREATE TABLE corrections
 (
	correction_id integer NOT NULL,
	checklistid integer NOT NULL,
	questionnumber integer NOT NULL,
	role boolean NOT NULL,
	answer character varying(2) NOT NULL,
	dateregistered date NOT NULL
);

ALTER TABLE corrections OWNER TO "vagrant";

CREATE SEQUENCE corrections_correction_id_seq
	START WITH 1
	INCREMENT BY 1
	NO MINVALUE
	NO MAXVALUE
	CACHE 1;

ALTER TABLE corrections_correction_id_seq OWNER TO "vagrant";

ALTER SEQUENCE corrections_correction_id_seq OWNED BY corrections.correction_id;

ALTER TABLE ONLY corrections ALTER COLUMN correction_id SET DEFAULT nextval('corrections_correction_id_seq'::regclass);

COPY corrections
 (correction_id, checklistid, questionnumber, role, answer, dateregistered) FROM stdin;
1	1	2	false	n	2018-08-09
2	1	6	false	n	2018-08-09
3	1	10	false	n	2018-08-09
4	1	14	false	n	2018-08-09
5	1	18	false	n	2018-08-09
6	1	22	false	n	2018-08-09
7	1	26	false	n	2018-08-09
8	1	30	false	n	2018-08-09
9	1	34	false	n	2018-08-09
10	1	38	false	n	2018-08-09
11	1	42	false	n	2018-08-09
12	1	46	false	n	2018-08-09
13	2	3	false	n	2018-08-10
14	2	7	false	n	2018-08-10
15	2	11	false	n	2018-08-10
16	2	15	false	n	2018-08-10
17	2	18	false	n	2018-08-10
\.

SELECT pg_catalog.setval('corrections_correction_id_seq', 12, true);

ALTER TABLE ONLY corrections

	ADD CONSTRAINT corrections_pkey PRIMARY KEY (correction_id);

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;

