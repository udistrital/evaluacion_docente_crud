package services

import (
	"fmt"
	"github.com/astaxie/beego/orm"
	"github.com/udistrital/evaluacion_docente_crud/models"
	//"github.com/udistrital/utils_oas/requestresponse"
)

func GetReporteAutoevaluacionIITresConsejo(evaluadorId string, periodoId int, procesoId int) ([]models.ReporteAutoevaluacionIITresConsejo, error) {
//func GetReporteAutoevaluacionIITresConsejo(evaluadorId string, periodoId int, procesoId int) ([]models.ReporteAutoevaluacionIITresConsejo, error) {
	o := orm.NewOrm()
	var resultados []models.ReporteAutoevaluacionIITresConsejo

	query := `
	WITH form_autoevaluacion_ii_tres AS (
		SELECT f.evaluado_id as documento, 
			f.espacio_academico_id as espacio_academico_id, 
			AVG(CASE WHEN c.tipo_campo_id = 4668 THEN (r.metadata ->> 'valor')::int ELSE NULL END) AS promedio,
			MAX(CASE WHEN i.orden = 6 THEN r.metadata ->> 'valor' end) AS respuesta_pregunta_1,
			MAX(CASE WHEN i.orden = 7 THEN r.metadata ->> 'valor' end) AS respuesta_pregunta_2,
			MAX(CASE WHEN i.orden = 8 THEN r.metadata ->> 'valor' end) AS respuesta_pregunta_3,
			MAX(CASE WHEN i.orden = 9 THEN r.metadata ->> 'valor' end) AS enlace
		FROM formulario f 
		JOIN formulario_plantilla_respuesta fpr ON f.id = fpr.formulario_id
		JOIN plantilla p ON fpr.plantilla_id = p.id
		JOIN item i ON p.item_id = i.id
		JOIN item_campo ic ON i.id = ic.item_id
		JOIN campo c ON ic.campo_id = c.id
		JOIN respuesta r ON fpr.respuesta_id = r.id
		WHERE f.id IN (
				SELECT id 
				FROM formulario 
				WHERE proceso_id = ?  
					AND evaluador_id = ?  
					AND periodo_id = ? 
		) 
		GROUP BY documento, espacio_academico_id 
	)
	SELECT 
		documento,
		espacio_academico_id,
		promedio,
		respuesta_pregunta_1,
		respuesta_pregunta_2,
		respuesta_pregunta_3,
		enlace
	FROM form_autoevaluacion_ii_tres;
	`

	_, err := o.Raw(query, procesoId, evaluadorId, periodoId).QueryRows(&resultados)
	if err != nil {
		return nil, fmt.Errorf("error ejecutando consulta: %v", err)
	}

	return resultados, nil
}