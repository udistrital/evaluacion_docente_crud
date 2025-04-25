package models

type ReporteCoevaluacionIConsejo struct {
	EspacioAcademicoId   int     `orm:"column(espacio_academico_id);null"`
	IdGrupo            string  `orm:"column(id_grupo);null"`
	Grupo              string  `orm:"column(grupo);null"`
	RespuestaPregunta1 string  `orm:"column(respuesta_pregunta_1);null"`
	RespuestaPregunta2 string  `orm:"column(respuesta_pregunta_2);null"`
	RespuestaPregunta3 string  `orm:"column(respuesta_pregunta_3);null"`
	Enlace             string  `orm:"column(enlace);null"`
}