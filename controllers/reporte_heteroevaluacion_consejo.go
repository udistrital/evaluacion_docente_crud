package controllers

import (
	"github.com/astaxie/beego"
	"github.com/udistrital/evaluacion_docente_crud/services"
)

// ReporteHeteroevaluacionConsejoController operations for ReporteHeteroevaluacionConsejo
type ReporteHeteroevaluacionConsejoController struct {
	beego.Controller
}

// URLMapping ...
func (c *ReporteHeteroevaluacionConsejoController) URLMapping() {
	c.Mapping("GetOne", c.GetOne)
}

// GetOne ...
// @Title Get reporte de heteroevaluación - Consejo
// @Description Obtiene los promedios por ámbito y promedio general de heteroevaluación para un evaluado
// @Param   evaluado_id	query	string	true	"ID del evaluado (ej. documento)"
// @Param   periodo_id  	query	int	true	"ID del periodo académico"
// @Param   proceso_id  	query	int	true	"ID del proceso"
// @Success 200 {object} []models.ReporteAutoevaluacionIITresConsejo
// @Failure 400 parámetros inválidos
// @Failure 500 error al ejecutar la consulta
// @router / [get]
func (c *ReporteHeteroevaluacionConsejoController) GetOne() {
	evaluadoId := c.GetString("evaluado_id")
	periodoId, err1 := c.GetInt("periodo_id")
	procesoId, err2 := c.GetInt("proceso_id")

	if err1 != nil || err2 != nil || evaluadoId == "" {
		c.Data["json"] = map[string]interface{}{
			"success": false,
			"error":   "Parámetros inválidos: se requieren evaluado_id, periodo_id y proceso_id",
		}
		c.Ctx.Output.SetStatus(400)
		c.ServeJSON()
		return
	}

	resultado, err := services.GetReporteHeteroevaluacionConsejo(evaluadoId, periodoId, procesoId)
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
