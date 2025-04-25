package services

import (
	"fmt"
	"github.com/astaxie/beego/orm"
	"github.com/udistrital/evaluacion_docente_crud/models"
)

func GetReporteCoevaluacionIConsejo(evaluadorId string, periodoId int, procesoId int) ([]models.ReporteCoevaluacionIConsejo, error) {
	var resultados []models.ReporteCoevaluacionIConsejo

	o := orm.NewOrm()
	/*err = o.Begin()

	if err != nil {
		return 
	}*/

	query := `
	WITH grupos_normalizados AS (
    SELECT 
        f.espacio_academico_id,
        jsonb_array_elements_text(
            CASE 
                WHEN jsonb_typeof(f.grupos::jsonb) = 'array' THEN f.grupos::jsonb
                ELSE jsonb_build_array(f.grupos::jsonb)
            END
        )::jsonb AS grupo_json,
        f.id AS formulario_id
    FROM formulario f
    WHERE f.id IN (
        SELECT id
        FROM formulario
        WHERE proceso_id = ?
        AND evaluador_id = ?
        AND periodo_id = ?
    )
),
preguntas AS (
    SELECT 
        g.espacio_academico_id,
        g.grupo_json ->> 'id_grupo' AS id_grupo,
        g.grupo_json ->> 'grupo' AS grupo,
        MAX(CASE WHEN i.orden = 1 THEN r.metadata ->> 'valor' END) AS respuesta_pregunta_1,
        MAX(CASE WHEN i.orden = 2 THEN r.metadata ->> 'valor' END) AS respuesta_pregunta_2,
        MAX(CASE WHEN i.orden = 3 THEN r.metadata ->> 'valor' END) AS respuesta_pregunta_3,
        MAX(CASE WHEN i.orden = 5 THEN r.metadata ->> 'valor' END) AS enlace
    FROM grupos_normalizados g
    JOIN formulario_plantilla_respuesta fpr ON g.formulario_id = fpr.formulario_id
    JOIN plantilla p ON fpr.plantilla_id = p.id
    JOIN item i ON p.item_id = i.id
    JOIN item_campo ic ON i.id = ic.item_id
    JOIN campo c ON ic.campo_id = c.id
    JOIN respuesta r ON fpr.respuesta_id = r.id
    GROUP BY g.espacio_academico_id, g.grupo_json
)
SELECT 
    espacio_academico_id,
    id_grupo,
    grupo,
    respuesta_pregunta_1,
    respuesta_pregunta_2,
    respuesta_pregunta_3,
    enlace
FROM preguntas;
	`

	_, err := o.Raw(query, procesoId, evaluadorId, periodoId).QueryRows(&resultados)
	if err != nil {
		return nil, fmt.Errorf("error ejecutando consulta: %v", err)
	}

	return resultados, nil
}