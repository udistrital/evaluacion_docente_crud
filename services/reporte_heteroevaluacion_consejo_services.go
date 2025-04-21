package services

import (
	"fmt"
	"github.com/astaxie/beego/orm"
	"github.com/udistrital/evaluacion_docente_crud/models"
)

func GetReporteHeteroevaluacionConsejo(evaluadoId string, periodoId int, procesoId int) ([]models.ReporteHeteroevaluacionConsejo, error) {
	o := orm.NewOrm()
	var resultados []models.ReporteHeteroevaluacionConsejo

	query := `
	WITH promedios AS (
		SELECT 
			f.espacio_academico_id AS espacio_academico_id,
			AVG((r.metadata ->> 'valor')::int) FILTER (WHERE p.seccion_id = 1 AND i.orden NOT IN (6)) AS promedio_ambito_1,
			AVG((r.metadata ->> 'valor')::int) FILTER (WHERE p.seccion_id = 2 AND i.orden NOT IN (6)) AS promedio_ambito_2,
			AVG((r.metadata ->> 'valor')::int) FILTER (WHERE p.seccion_id = 3 AND i.orden NOT IN (12)) AS promedio_ambito_3
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
			AND evaluado_id = ? 
			AND periodo_id = ?
		)
		GROUP BY f.espacio_academico_id
	)
	SELECT 
		espacio_academico_id,
		promedio_ambito_1,
		promedio_ambito_2,
		promedio_ambito_3,
		(promedio_ambito_1 + promedio_ambito_2 + promedio_ambito_3) / 3 AS promedio_final
	FROM promedios;
	`

	_, err := o.Raw(query, procesoId, evaluadoId, periodoId).QueryRows(&resultados)
	if err != nil {
		return nil, fmt.Errorf("error ejecutando consulta: %v", err)
	}

	return resultados, nil
}
