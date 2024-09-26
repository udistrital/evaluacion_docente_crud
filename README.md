# Evaluacion docente CRUD

El API provee la gestion de las diferentes procesos que requiere una evaluación docente

## Especificaciones Técnicas

### Tecnologías Implementadas y Versiones
* [Golang](https://github.com/udistrital/introduccion_oas/blob/master/instalacion_de_herramientas/golang.md)
* [BeeGo](https://github.com/udistrital/introduccion_oas/blob/master/instalacion_de_herramientas/beego.md)
* [Docker](https://docs.docker.com/engine/install/ubuntu/)
* [Docker Compose](https://docs.docker.com/compose/)

### Variables de Entorno
```shell
# parametros de api
EVALUACION_DOCENTE_CRUD_HTTP_PORT=[Puerto de exposición del API]
EVALUACION_DOCENTE_CRUD_RUN_MODE=[Modo de ejecución del API]
# paramametros de bd
EVALUACION_DOCENTE_CRUD_PGUSER=[Usuario de BD]
EVALUACION_DOCENTE_CRUD_PGPASS=[Contraseña del usaurio de BD]
EVALUACION_DOCENTE_CRUD_PGHOST=[URL, Dominio o EndPoint de la BD]
EVALUACION_DOCENTE_CRUD_PGPORT=[Puerto de la BD]
EVALUACION_DOCENTE_CRUD_PGDB=[Nombre de Base de Datos]
EVALUACION_DOCENTE_CRUD_PGSCHEMA=[Nombre del Esquema de Base de Datos]
```
**NOTA:** Las variables se pueden ver en el fichero conf/app.conf y están identificadas con EVALUACION_DOCENTE_CRUD_...

### Ejecución del Proyecto
```shell
#1. Obtener el repositorio con Go
go get github.com/udistrital/evaluacion_docente_crud

#2. Moverse a la carpeta del repositorio
cd $GOPATH/src/github.com/udistrital/evaluacion_docente_crud

# 3. Moverse a la rama **develop**
git pull origin develop && git checkout develop

# 4. alimentar todas las variables de entorno que utiliza el proyecto.
EVALUACION_DOCENTE_CRUD_PORT=8080 EVALUACION_DOCENTE_CRUD_SOME_VARIABLE bee run
```

### Ejecución Dockerfile
```shell
# docker build --tag=evaluacion_docente_crud . --no-cache
# docker run -p 80:80 evaluacion_docente_crud
```

### Ejecución docker-compose
```shell
# 1. Obtener repositorio
git clone https://github.com/udistrital/evaluacion_docente_crud.git
# 2. Ir a la carpeta del repositorio
cd $GOPATH/src/github.com/evaluacion_docente_crud
# 3. Cambiar a la rama develop
git checkout develop
# 4. Crear red back_end
docker network create back_end
# 5. Ejecutar docker compose
docker-compose up --build --remove-orphans
```

### Ejecución Pruebas

Pruebas unitarias
```shell
# En Proceso
```
## Estado CI

| Develop | Relese 0.0.1 | Master |
| -- | -- | -- |
| [![Build Status](https://hubci.portaloas.udistrital.edu.co/api/badges/udistrital/evaluacion_docente_crud/status.svg?ref=refs/heads/develop)](https://hubci.portaloas.udistrital.edu.co/udistrital/evaluacion_docente_crud) | [![Build Status](https://hubci.portaloas.udistrital.edu.co/api/badges/udistrital/evaluacion_docente_crud/status.svg?ref=refs/heads/release/0.0.1)](https://hubci.portaloas.udistrital.edu.co/udistrital/evaluacion_docente_crud) | [![Build Status](https://hubci.portaloas.udistrital.edu.co/api/badges/udistrital/evaluacion_docente_crud/status.svg)](https://hubci.portaloas.udistrital.edu.co/udistrital/evaluacion_docente_crud) |


## Modelo de Datos

![Modelo de Datos API CRUD Evaluacion Docente](/database/evaluacion_docente_crud.png)
[Modelo de Datos API CRUD Evaluacion Docente](/database/evaluacion_docente_crud.png)

## Licencia

This file is part of evaluacion_docente_crud.

evaluacion_docente_crud is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

evaluacion_docente_crud is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with novedades_crud. If not, see https://www.gnu.org/licenses/.

