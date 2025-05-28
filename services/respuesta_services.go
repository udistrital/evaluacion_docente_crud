package services

import (
	"github.com/udistrital/evaluacion_docente_crud/models"
)

// FetchDocumentUUIDs es la función que llama el controlador.
func FetchDocumentUUIDs(periodoID int, evaluadoID string) ([]string, error) {
	return models.GetDocumentUUIDs(periodoID, evaluadoID)
}
