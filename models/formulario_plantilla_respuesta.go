package models

import "time"

type FormularioPlantillaRespuesta struct {
	Id_RENAME         int         `orm:"column(id)"`
	FormularioId      *Formulario `orm:"column(formulario_id);rel(fk)"`
	PlantillaId       *Plantilla  `orm:"column(plantilla_id);rel(fk)"`
	RespuestaId       *Respuesta  `orm:"column(respuesta_id);rel(fk)"`
	Activo            bool        `orm:"column(activo)"`
	FechaCreacion     time.Time   `orm:"column(fecha_creacion);type(timestamp without time zone)"`
	FechaModificacion time.Time   `orm:"column(fecha_modificacion);type(timestamp without time zone)"`
}
