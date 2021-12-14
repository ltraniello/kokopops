#!/bin/bash

COMMAND_DIR="test"

if [ "$1" == "commands" ]; then
  ls "${COMMAND_DIR}" | sed -e 's/\.sh$//'
elif [ "$1" == "deploy" ] || [ "$1" == "test" ]; then
  if [ "$1" == "deploy" ]; then
    COMMAND_DIR="cmd"
  fi 
  FILE="${COMMAND_DIR}/$2.sh"
  if [[ -f "$FILE" ]]; then
    read PROVIDER CLUSTER <<< sed -n 's/^#cluster:\(.*\):\(.*\)/\1 \2/p' ${FILE}
    if [ "$PROVIDER" != "gcp" ]; then
      echo "Unknown cluster provider $PROVIDER, use gcp"
      exit 1
    fi
    if [ -z "${CLUSTER}" ]; then
      echo "Cluster name is missing in ${FILE}, add a #cluster:gcp:[NAME] line"
      exit 1
    fi

    kubectl config use-context "${CLUSTER}" || exit 1
    . "${FILE}"
  else
    echo "command file not found : ${FILE}"
    exit 1
  fi
else
  echo "Unknown arg 1 use deploy"
  exit 1
fi