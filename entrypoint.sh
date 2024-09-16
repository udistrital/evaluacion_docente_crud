#!/usr/bin/env bash

set -e
set -u
set -o pipefail

if [ -n "${PARAMETER_STORE:-}" ]; then
  export EVALUACION_DOCENTE_CRUD_PGUSER="$(aws ssm get-parameter --name /${PARAMETER_STORE}/evaluacion_docente_crud/db/username --output text --query Parameter.Value)"
  export EVALUACION_DOCENTE_CRUD_PGPASS="$(aws ssm get-parameter --with-decryption --name /${PARAMETER_STORE}/evaluacion_docente_crud/db/password --output text --query Parameter.Value)"
fi

exec ./main "$@"