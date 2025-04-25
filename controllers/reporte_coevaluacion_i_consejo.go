package controllers

import (
	"github.com/astaxie/beego"
	"github.com/udistrital/evaluacion_docente_crud/services"
)

// ReporteCoevaluacionIConsejoController operations for ReporteCoevaluacionIConsejo
type ReporteCoevaluacionIConsejoController struct {
	beego.Controller
}

// URLMapping ...
func (c *ReporteCoevaluacionIConsejoController) URLMapping() {
	c.Mapping("GetOne", c.GetOne)
}

// GetOne ...
// @Title Get reporte de coevaluación I - Consejo
// @Description Obtiene las respuestas abiertas de la coevaluación I por evaluador y grupo
// @Param   evaluador_id	query	string	true	"ID del evaluador (ej. documento)"
// @Param   periodo_id  	query	int	true	"ID del periodo académico"
// @Param   proceso_id  	query	int	true	"ID del proceso"
// @Success 200 {object} []models.ReporteCoevaluacionIConsejo
// @Failure 400 parámetros inválidos
// @Failure 500 error al ejecutar la consulta
// @router / [get]
func (c *ReporteCoevaluacionIConsejoController) GetOne() {
	evaluadorId := c.GetString("evaluador_id")
	periodoId, err1 := c.GetInt("periodo_id")
	procesoId, err2 := c.GetInt("proceso_id")

	if err1 != nil || err2 != nil || evaluadorId == "" {
		c.Data["json"] = map[string]interface{}{
			"success": false,
			"error":   "Parámetros inválidos: se requieren evaluador_id, periodo_id y proceso_id",
		}
		c.Ctx.Output.SetStatus(400)
		c.ServeJSON()
		return
	}

	resultado, err := services.GetReporteCoevaluacionIConsejo(evaluadorId, periodoId, procesoId)
	if err != nil {
		c.Data["json"] = map[string]interface{}{
			"success": false,
			"error":   err.Error(),
		}
		c.Ctx.Output.SetStatus(500)
		c.ServeJSON()
		return
	}

	c.Data["json"] = resultado
	c.ServeJSON()
}

