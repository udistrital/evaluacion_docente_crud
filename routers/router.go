// @APIVersion 1.0.0
// @Title beego Test API
// @Description beego has a very cool tools to autogenerate documents for your API
// @Contact astaxie@gmail.com
// @TermsOfServiceUrl http://beego.me/
// @License Apache 2.0
// @LicenseUrl http://www.apache.org/licenses/LICENSE-2.0.html
package routers

import (
	"github.com/astaxie/beego"
)

func init() {
	ns := beego.NewNamespace("/v1",

		beego.NSNamespace("/area_tipo",
			beego.NSInclude(
				&controllers.AreaTipoController{},
			),
		),

		beego.NSNamespace("/tipo_parametro",
			beego.NSInclude(
				&controllers.TipoParametroController{},
			),
		),

		beego.NSNamespace("/parametro",
			beego.NSInclude(
				&controllers.ParametroController{},
			),
		),

		beego.NSNamespace("/parametro_periodo",
			beego.NSInclude(
				&controllers.ParametroPeriodoController{},
			),
		),

		beego.NSNamespace("/periodo",
			beego.NSInclude(
				&controllers.PeriodoController{},
			),
		),

		beego.NSNamespace("/modulo_publicacion",
			beego.NSInclude(
				&controllers.ModuloPublicacionController{},
			),
		),

		beego.NSNamespace("/noticia",
			beego.NSInclude(
				&controllers.NoticiaController{},
			),
		),

		beego.NSNamespace("/noticia_etiqueta",
			beego.NSInclude(
				&controllers.NoticiaEtiquetaController{},
			),
		),

		beego.NSNamespace("/correo",
			beego.NSInclude(
				&controllers.CorreoController{},
			),
		),

		beego.NSNamespace("/contacto",
			beego.NSInclude(
				&controllers.ContactoController{},
			),
		),

		beego.NSNamespace("/telefono",
			beego.NSInclude(
				&controllers.TelefonoController{},
			),
		),

		beego.NSNamespace("/noticia_contenido",
			beego.NSInclude(
				&controllers.NoticiaContenidoController{},
			),
		),

		beego.NSNamespace("/estado_inscripcion",
			beego.NSInclude(
				&controllers.EstadoInscripcionController{},
			),
		),

		beego.NSNamespace("/reintegro",
			beego.NSInclude(
				&controllers.ReintegroController{},
			),
		),

		beego.NSNamespace("/tipo_proyecto",
			beego.NSInclude(
				&controllers.TipoProyectoController{},
			),
		),

		beego.NSNamespace("/tipo_inscripcion",
			beego.NSInclude(
				&controllers.TipoInscripcionController{},
			),
		),

		beego.NSNamespace("/inscripcion_pregrado",
			beego.NSInclude(
				&controllers.InscripcionPregradoController{},
			),
		),

		beego.NSNamespace("/tipo_icfes",
			beego.NSInclude(
				&controllers.TipoIcfesController{},
			),
		),

		beego.NSNamespace("/inscripcion_posgrado",
			beego.NSInclude(
				&controllers.InscripcionPosgradoController{},
			),
		),

		beego.NSNamespace("/propuesta",
			beego.NSInclude(
				&controllers.PropuestaController{},
			),
		),

		beego.NSNamespace("/transferencia",
			beego.NSInclude(
				&controllers.TransferenciaController{},
			),
		),

		beego.NSNamespace("/tipo_documento_programa",
			beego.NSInclude(
				&controllers.TipoDocumentoProgramaController{},
			),
		),

		beego.NSNamespace("/soporte_documento_programa",
			beego.NSInclude(
				&controllers.SoporteDocumentoProgramaController{},
			),
		),

		beego.NSNamespace("/inscripcion",
			beego.NSInclude(
				&controllers.InscripcionController{},
			),
		),

		beego.NSNamespace("/documento_programa",
			beego.NSInclude(
				&controllers.DocumentoProgramaController{},
			),
		),

		beego.NSNamespace("/documento_cupo",
			beego.NSInclude(
				&controllers.DocumentoCupoController{},
			),
		),

		beego.NSNamespace("/cupo_inscripcion",
			beego.NSInclude(
				&controllers.CupoInscripcionController{},
			),
		),

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
	)
	beego.AddNamespace(ns)
}
