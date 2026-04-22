// @APIVersion 1.0.0
// @Title beego Test API
// @Description beego has a very cool tools to autogenerate documents for your API
// @Contact astaxie@gmail.com
// @TermsOfServiceUrl http://beego.me/
// @License Apache 2.0
// @LicenseUrl http://www.apache.org/licenses/LICENSE-2.0.html
package routers

import (
	"github.com/udistrital/evaluacion_docente_crud/controllers"

	"github.com/astaxie/beego"
)

func init() {
	ns := beego.NewNamespace("/v1",

		beego.NSNamespace("/seccion",
			beego.NSInclude(
				&controllers.SeccionController{},
			),
		),

		beego.NSNamespace("/plantilla",
			beego.NSInclude(
				&controllers.PlantillaController{},
			),
		),

		beego.NSNamespace("/item",
			beego.NSInclude(
				&controllers.ItemController{},
			),
		),

		beego.NSNamespace("/item_campo",
			beego.NSInclude(
				&controllers.ItemCampoController{},
			),
		),

		beego.NSNamespace("/campo",
			beego.NSInclude(
				&controllers.CampoController{},
			),
		),

		beego.NSNamespace("/formulario",
			beego.NSInclude(
				&controllers.FormularioController{},
			),
		),

		beego.NSNamespace("/respuesta",
			beego.NSInclude(
				&controllers.RespuestaController{},
			),
		),

		beego.NSNamespace("/formrespuesta",
			beego.NSInclude(
				&controllers.FormularioPlantillaRespuestaController{},
			),
		),

		beego.NSNamespace("/proceso_parametro",
			beego.NSInclude(
				&controllers.ProcesoParametroController{},
			),
		),

		beego.NSNamespace("/reporte_heteroevaluacion_consejo",
			beego.NSInclude(
				&controllers.ReporteHeteroevaluacionConsejoController{},
			),
		),

		beego.NSNamespace("/reporte_autoevaluacion_ii_tres_consejo",
			beego.NSInclude(
				&controllers.ReporteAutoevaluacionIITresConsejoController{},
			),
		),

		beego.NSNamespace("/reporte_coevaluacion_i_consejo",
			beego.NSInclude(
				&controllers.ReporteCoevaluacionIConsejoController{},
			),
		),
	)
	beego.AddNamespace(ns)
}
