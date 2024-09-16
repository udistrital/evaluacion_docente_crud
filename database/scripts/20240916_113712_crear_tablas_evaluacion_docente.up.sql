-- object: evaluacion_docente | type: SCHEMA --
-- DROP SCHEMA IF EXISTS evaluacion_docente CASCADE;
CREATE SCHEMA evaluacion_docente;
-- ddl-end --

SET search_path TO pg_catalog,public,evaluacion_docente;
-- ddl-end --

-- object: evaluacion_docente.formulario | type: TABLE --
-- DROP TABLE IF EXISTS evaluacion_docente.formulario CASCADE;
CREATE TABLE evaluacion_docente.formulario (
	id serial NOT NULL,
	periodo_id integer NOT NULL,
	tercero_id integer NOT NULL,
	evaluado_id integer NOT NULL,
	espacio_academico_id integer NOT NULL,
	proyecto_curricular_id integer NOT NULL,
	activo bool NOT NULL,
	fecha_creacion timestamp NOT NULL,
	fecha_modificacion timestamp NOT NULL,
	CONSTRAINT pk_formulario PRIMARY KEY (id),
	CONSTRAINT uq_periodo_tercero_evaluado_espacio_proyecto_formulario UNIQUE (tercero_id,periodo_id,espacio_academico_id,proyecto_curricular_id,evaluado_id)
);
-- ddl-end --

-- object: evaluacion_docente.plantilla | type: TABLE --
-- DROP TABLE IF EXISTS evaluacion_docente.plantilla CASCADE;
CREATE TABLE evaluacion_docente.plantilla (
	id serial NOT NULL,
	seccion_id integer NOT NULL,
	item_id integer NOT NULL,
	estructura_id varchar NOT NULL,
	proceso_id integer NOT NULL,
	activo bool NOT NULL,
	fecha_creacion timestamp NOT NULL,
	fecha_modificacion timestamp NOT NULL,
	CONSTRAINT pk_plantilla PRIMARY KEY (id)
);
-- ddl-end --

-- object: evaluacion_docente.seccion | type: TABLE --
-- DROP TABLE IF EXISTS evaluacion_docente.seccion CASCADE;
CREATE TABLE evaluacion_docente.seccion (
	id serial NOT NULL,
	nombre varchar NOT NULL,
	orden integer NOT NULL,
	activo bool NOT NULL,
	fecha_creacion timestamp NOT NULL,
	fecha_modificacion timestamp NOT NULL,
	CONSTRAINT pk_seccion PRIMARY KEY (id)
);
-- ddl-end --

-- object: evaluacion_docente.item | type: TABLE --
-- DROP TABLE IF EXISTS evaluacion_docente.item CASCADE;
CREATE TABLE evaluacion_docente.item (
	id serial NOT NULL,
	orden integer NOT NULL,
	nombre varchar NOT NULL,
	activo bool NOT NULL,
	fecha_creacion timestamp NOT NULL,
	fecha_modificacion timestamp NOT NULL,
	CONSTRAINT pk_item PRIMARY KEY (id)
);
-- ddl-end --

-- object: evaluacion_docente.item_campo | type: TABLE --
-- DROP TABLE IF EXISTS evaluacion_docente.item_campo CASCADE;
CREATE TABLE evaluacion_docente.item_campo (
	id serial NOT NULL,
	item_id integer NOT NULL,
	campo_id integer NOT NULL,
	porcentaje numeric,
	activo bool NOT NULL,
	fecha_creacion timestamp NOT NULL,
	fecha_modificacion timestamp NOT NULL,
	CONSTRAINT pk_item_campo PRIMARY KEY (id)
);
-- ddl-end --

-- object: evaluacion_docente.campo | type: TABLE --
-- DROP TABLE IF EXISTS evaluacion_docente.campo CASCADE;
CREATE TABLE evaluacion_docente.campo (
	id serial NOT NULL,
	tipo_campo_id integer NOT NULL,
	campo_padre_id integer,
	nombre varchar NOT NULL,
	valor integer,
	activo bool NOT NULL,
	fecha_creacion timestamp NOT NULL,
	fecha_modificacion timestamp NOT NULL,
	CONSTRAINT pk_campo PRIMARY KEY (id)
);
-- ddl-end --

-- object: evaluacion_docente.respuesta | type: TABLE --
-- DROP TABLE IF EXISTS evaluacion_docente.respuesta CASCADE;
CREATE TABLE evaluacion_docente.respuesta (
	id serial NOT NULL,
	metadata json NOT NULL,
	activo bool NOT NULL,
	fecha_creacion timestamp NOT NULL,
	fecha_modificacion timestamp NOT NULL,
	CONSTRAINT pk_respuesta PRIMARY KEY (id)
);
-- ddl-end --

-- object: evaluacion_docente.formulario_plantilla_respuesta | type: TABLE --
-- DROP TABLE IF EXISTS evaluacion_docente.formulario_plantilla_respuesta CASCADE;
CREATE TABLE evaluacion_docente.formulario_plantilla_respuesta (
	id serial NOT NULL,
	formulario_id integer NOT NULL,
	plantilla_id integer NOT NULL,
	respuesta_id integer NOT NULL,
	activo bool NOT NULL,
	fecha_creacion timestamp NOT NULL,
	fecha_modificacion timestamp NOT NULL,
	CONSTRAINT pk_formulario_plantilla_respuesta PRIMARY KEY (formulario_id,plantilla_id,respuesta_id,id)
);
-- ddl-end --

-- object: fk_plantilla_seccion | type: CONSTRAINT --
-- ALTER TABLE evaluacion_docente.plantilla DROP CONSTRAINT IF EXISTS fk_plantilla_seccion CASCADE;
ALTER TABLE evaluacion_docente.plantilla ADD CONSTRAINT fk_plantilla_seccion FOREIGN KEY (seccion_id)
REFERENCES evaluacion_docente.seccion (id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_plantilla_item | type: CONSTRAINT --
-- ALTER TABLE evaluacion_docente.plantilla DROP CONSTRAINT IF EXISTS fk_plantilla_item CASCADE;
ALTER TABLE evaluacion_docente.plantilla ADD CONSTRAINT fk_plantilla_item FOREIGN KEY (item_id)
REFERENCES evaluacion_docente.item (id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_item_campo_item | type: CONSTRAINT --
-- ALTER TABLE evaluacion_docente.item_campo DROP CONSTRAINT IF EXISTS fk_item_campo_item CASCADE;
ALTER TABLE evaluacion_docente.item_campo ADD CONSTRAINT fk_item_campo_item FOREIGN KEY (item_id)
REFERENCES evaluacion_docente.item (id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_item_campo_campo | type: CONSTRAINT --
-- ALTER TABLE evaluacion_docente.item_campo DROP CONSTRAINT IF EXISTS fk_item_campo_campo CASCADE;
ALTER TABLE evaluacion_docente.item_campo ADD CONSTRAINT fk_item_campo_campo FOREIGN KEY (campo_id)
REFERENCES evaluacion_docente.campo (id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_formulario_plantilla_respuesta_formulario | type: CONSTRAINT --
-- ALTER TABLE evaluacion_docente.formulario_plantilla_respuesta DROP CONSTRAINT IF EXISTS fk_formulario_plantilla_respuesta_formulario CASCADE;
ALTER TABLE evaluacion_docente.formulario_plantilla_respuesta ADD CONSTRAINT fk_formulario_plantilla_respuesta_formulario FOREIGN KEY (formulario_id)
REFERENCES evaluacion_docente.formulario (id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_formulario_plantilla_respuesta_plantilla | type: CONSTRAINT --
-- ALTER TABLE evaluacion_docente.formulario_plantilla_respuesta DROP CONSTRAINT IF EXISTS fk_formulario_plantilla_respuesta_plantilla CASCADE;
ALTER TABLE evaluacion_docente.formulario_plantilla_respuesta ADD CONSTRAINT fk_formulario_plantilla_respuesta_plantilla FOREIGN KEY (plantilla_id)
REFERENCES evaluacion_docente.plantilla (id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_formulario_plantilla_respuesta_respuesta | type: CONSTRAINT --
-- ALTER TABLE evaluacion_docente.formulario_plantilla_respuesta DROP CONSTRAINT IF EXISTS fk_formulario_plantilla_respuesta_respuesta CASCADE;
ALTER TABLE evaluacion_docente.formulario_plantilla_respuesta ADD CONSTRAINT fk_formulario_plantilla_respuesta_respuesta FOREIGN KEY (respuesta_id)
REFERENCES evaluacion_docente.respuesta (id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- Permisos de usuario
GRANT USAGE ON SCHEMA evaluacion_docente TO desarrollooas;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA evaluacion_docente TO desarrollooas;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA evaluacion_docente TO desarrollooas;