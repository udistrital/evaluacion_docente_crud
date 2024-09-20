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
COMMENT ON TABLE evaluacion_docente.formulario IS 'Lleva registro de evaluacion presentada por evaluador hacia evaluado en periodo academico particular';
-- ddl-end --
COMMENT ON COLUMN evaluacion_docente.formulario.id IS 'Identificador de la tabla';
-- ddl-end --
COMMENT ON COLUMN evaluacion_docente.formulario.periodo_id IS 'Id de periodo academico';
-- ddl-end --
COMMENT ON COLUMN evaluacion_docente.formulario.tercero_id IS 'Id de tercero o evaluador';
-- ddl-end --
COMMENT ON COLUMN evaluacion_docente.formulario.evaluado_id IS 'Id de tercero o evaluado';
-- ddl-end --
COMMENT ON COLUMN evaluacion_docente.formulario.espacio_academico_id IS 'Id de espacio academico';
-- ddl-end --
COMMENT ON COLUMN evaluacion_docente.formulario.proyecto_curricular_id IS 'Id de proyecto curricular';
-- ddl-end --
COMMENT ON COLUMN evaluacion_docente.formulario.activo IS 'Flag que indica si el formulario esta activo o no';
-- ddl-end --
COMMENT ON COLUMN evaluacion_docente.formulario.fecha_creacion IS 'Fecha de creacion del registro';
-- ddl-end --
COMMENT ON COLUMN evaluacion_docente.formulario.fecha_modificacion IS 'Fecha de ultima modificacion del registro';
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
COMMENT ON TABLE evaluacion_docente.plantilla IS 'Relaciona las secciones con los items o preguntas para un tipo de evaluacion en particular';
-- ddl-end --
COMMENT ON COLUMN evaluacion_docente.plantilla.id IS 'Identificador de la tabla';
-- ddl-end --
COMMENT ON COLUMN evaluacion_docente.plantilla.seccion_id IS 'Id de la seccion de la evaluacion';

COMMENT ON COLUMN evaluacion_docente.plantilla.item_id IS 'Id del item o pregunta';
-- ddl-end --
COMMENT ON COLUMN evaluacion_docente.plantilla.estructura_id IS 'Id de estructura fomulario proveniente de formularios_dinamicos_crud';
-- ddl-end --
COMMENT ON COLUMN evaluacion_docente.plantilla.proceso_id IS 'Id referente al proceso proveniente de parametros_crud';
-- ddl-end --
COMMENT ON COLUMN evaluacion_docente.plantilla.activo IS 'Flag que indica si la plantilla esta activa o no';
-- ddl-end --
COMMENT ON COLUMN evaluacion_docente.plantilla.fecha_creacion IS 'Fecha de creacion del registro';
-- ddl-end --
COMMENT ON COLUMN evaluacion_docente.plantilla.fecha_modificacion IS 'Fecha de ultima modificacion del registro';
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
COMMENT ON TABLE evaluacion_docente.seccion IS 'Lista distintas secciones de evaluacion';
-- ddl-end --
COMMENT ON COLUMN evaluacion_docente.seccion.id IS 'Identificador de la tabla';
-- ddl-end --
COMMENT ON COLUMN evaluacion_docente.seccion.nombre IS 'Nombre de la seccion';
-- ddl-end --
COMMENT ON COLUMN evaluacion_docente.seccion.orden IS 'Numero para establecer orden de la seccion';
-- ddl-end --
COMMENT ON COLUMN evaluacion_docente.seccion.activo IS 'Flag que indica si la seccion esta activa o no';
-- ddl-end --
COMMENT ON COLUMN evaluacion_docente.seccion.fecha_creacion IS 'Fecha de creacion del registro';
-- ddl-end --
COMMENT ON COLUMN evaluacion_docente.seccion.fecha_modificacion IS 'Fecha de ultima modificacion del registro';
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
COMMENT ON TABLE evaluacion_docente.item IS 'Lista de items o preguntas de evaluacion';
-- ddl-end --
COMMENT ON COLUMN evaluacion_docente.item.id IS 'Identificador de la tabla';
-- ddl-end --
COMMENT ON COLUMN evaluacion_docente.item.orden IS 'Numero para establecer orden de items';
-- ddl-end --
COMMENT ON COLUMN evaluacion_docente.item.nombre IS 'Nombre del item o pregunta';
-- ddl-end --
COMMENT ON COLUMN evaluacion_docente.item.activo IS 'Flag que indica si el item esta activo o no';
-- ddl-end --
COMMENT ON COLUMN evaluacion_docente.item.fecha_creacion IS 'Fecha de creacion del registro';
-- ddl-end --
COMMENT ON COLUMN evaluacion_docente.item.fecha_modificacion IS 'Fecha de ultima modificacion del registro';
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
COMMENT ON TABLE evaluacion_docente.item_campo IS 'Relacion entre item o pregunta y campo u opciones de respuesta';
-- ddl-end --
COMMENT ON COLUMN evaluacion_docente.item_campo.id IS 'Identificador de la tabla';
-- ddl-end --
COMMENT ON COLUMN evaluacion_docente.item_campo.item_id IS 'Id de item o pregunta';
-- ddl-end --
COMMENT ON COLUMN evaluacion_docente.item_campo.campo_id IS 'Id de campo u opcion de respuesta';
-- ddl-end --
COMMENT ON COLUMN evaluacion_docente.item_campo.porcentaje IS 'Valor porcentaje que valora la importancia de la pregunta';
-- ddl-end --
COMMENT ON COLUMN evaluacion_docente.item_campo.activo IS 'Flag que indica si el item_campo esta activo o no';
-- ddl-end --
COMMENT ON COLUMN evaluacion_docente.item_campo.fecha_creacion IS 'Fecha de creacion del registro';
-- ddl-end --
COMMENT ON COLUMN evaluacion_docente.item_campo.fecha_modificacion IS 'Fecha de ultima modificacion del registro';
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
COMMENT ON TABLE evaluacion_docente.campo IS 'Lista de campos u opciones de respuesta';
-- ddl-end --
COMMENT ON COLUMN evaluacion_docente.campo.id IS 'Identificador de la tabla';
-- ddl-end --
COMMENT ON COLUMN evaluacion_docente.campo.tipo_campo_id IS 'Id tipo campo proveniente de parametros_crud';
-- ddl-end --
COMMENT ON COLUMN evaluacion_docente.campo.campo_padre_id IS 'Id de campo padre';
-- ddl-end --
COMMENT ON COLUMN evaluacion_docente.campo.nombre IS 'Nombre de la opcion de respuesta';
-- ddl-end --
COMMENT ON COLUMN evaluacion_docente.campo.valor IS 'Valor de la opcion de respuesta';
-- ddl-end --
COMMENT ON COLUMN evaluacion_docente.campo.activo IS 'Flag que indica si el campo esta activo o no';
-- ddl-end --
COMMENT ON COLUMN evaluacion_docente.campo.fecha_creacion IS 'Fecha de creacion del registro';
-- ddl-end --
COMMENT ON COLUMN evaluacion_docente.campo.fecha_modificacion IS 'Fecha de ultima modificacion del registro';
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
COMMENT ON TABLE evaluacion_docente.respuesta IS 'Registra respuestas a preguntas de formulario evaluacion';
-- ddl-end --
COMMENT ON COLUMN evaluacion_docente.respuesta.id IS 'Identificador de la tabla';
-- ddl-end --
COMMENT ON COLUMN evaluacion_docente.respuesta.metadata IS 'Campo json para almacenar cualquier tipo de respuesta';
-- ddl-end --
COMMENT ON COLUMN evaluacion_docente.respuesta.activo IS 'Flag que indica si la respuesta esta activa o no';
-- ddl-end --
COMMENT ON COLUMN evaluacion_docente.respuesta.fecha_creacion IS 'Fecha de creacion del registro';
-- ddl-end --
COMMENT ON COLUMN evaluacion_docente.respuesta.fecha_modificacion IS 'Fecha de ultima modificacion del registro';
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
COMMENT ON TABLE evaluacion_docente.formulario_plantilla_respuesta IS 'Relaciona el formulario o evaluacion presentada por evaluador con preguntas y respuestas';
-- ddl-end --
COMMENT ON COLUMN evaluacion_docente.formulario_plantilla_respuesta.id IS 'Identificador de la tabla';
-- ddl-end --
COMMENT ON COLUMN evaluacion_docente.formulario_plantilla_respuesta.formulario_id IS 'Id de formulario o evaluacion';
-- ddl-end --
COMMENT ON COLUMN evaluacion_docente.formulario_plantilla_respuesta.plantilla_id IS 'Id de la plantilla o relacion de secciones y preguntas';
-- ddl-end --
COMMENT ON COLUMN evaluacion_docente.formulario_plantilla_respuesta.respuesta_id IS 'Id de respuestas a items';
-- ddl-end --
COMMENT ON COLUMN evaluacion_docente.formulario_plantilla_respuesta.activo IS 'Flag que indica si la respuesta esta activa o no';
-- ddl-end --
COMMENT ON COLUMN evaluacion_docente.formulario_plantilla_respuesta.fecha_creacion IS 'Fecha de creacion del registro';
-- ddl-end --
COMMENT ON COLUMN evaluacion_docente.formulario_plantilla_respuesta.fecha_modificacion IS 'Fecha de ultima modificacion del registro';
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