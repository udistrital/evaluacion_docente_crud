package models

type ReporteAutoevaluacionIITresConsejo struct {
	Documento          string  `orm:"column(documento);null"`
	EspacioAcademicoId int     `orm:"column(espacio_academico_id);null"`
	Promedio           float64 `orm:"column(promedio);null"`
	RespuestaPregunta1 string  `orm:"column(respuesta_pregunta_1);null"`
	RespuestaPregunta2 string  `orm:"column(respuesta_pregunta_2);null"`
	RespuestaPregunta3 string  `orm:"column(respuesta_pregunta_3);null"`
	Enlace             string  `orm:"column(enlace);null"`
}
