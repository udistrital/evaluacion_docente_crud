package models

type ReporteHeteroevaluacionConsejo struct {
	EspacioAcademicoId int     `orm:"column(espacio_academico_id);null"`
	Ambito1            float64 `orm:"column(promedio_ambito_1);null"`
	Ambito2            float64 `orm:"column(promedio_ambito_2);null"`
	Ambito3            float64 `orm:"column(promedio_ambito_3);null"`
	PromedioFinal      float64 `orm:"column(promedio_final);null"`
}
