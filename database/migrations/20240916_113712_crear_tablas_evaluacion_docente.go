package main

import (
	"fmt"
	"io/ioutil"
	"strings"

	"github.com/astaxie/beego/migration"
)

// DO NOT MODIFY
type CrearTablasEvaluacionDocente_20240916_113712 struct {
	migration.Migration
}

// DO NOT MODIFY
func init() {
	m := &CrearTablasEvaluacionDocente_20240916_113712{}
	m.Created = "20240916_113712"

	migration.Register("CrearTablasEvaluacionDocente_20240916_113712", m)
}

// Run the migrations
func (m *CrearTablasEvaluacionDocente_20240916_113712) Up() {
	// use m.SQL("CREATE TABLE ...") to make schema update
	file, err := ioutil.ReadFile("../scripts/20240916_113712_crear_tablas_evaluacion_docente.up.sql")

	if err != nil {
		// handle error
		fmt.Println(err)
	}

	requests := strings.Split(string(file), ";")

	for _, request := range requests {
		fmt.Println(request)
		m.SQL(request)
		// do whatever you need with result and error
	}
}

// Reverse the migrations
func (m *CrearTablasEvaluacionDocente_20240916_113712) Down() {
	// use m.SQL("DROP TABLE ...") to reverse schema update
	file, err := ioutil.ReadFile("../scripts/20240916_113712_crear_tablas_evaluacion_docente.down.sql")

	if err != nil {
		// handle error
		fmt.Println(err)
	}

	requests := strings.Split(string(file), ";")

	for _, request := range requests {
		fmt.Println(request)
		m.SQL(request)
		// do whatever you need with result and error
	}
}
