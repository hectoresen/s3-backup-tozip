#!/bin/bash

# Variables
SOURCE_BUCKET="ofl-development-terraform-state"
SCRIPT_DIR=$(pwd)
LOCAL_FOLDER="$SCRIPT_DIR/$SOURCE_BUCKET"
ZIP_FILE="$SCRIPT_DIR/${SOURCE_BUCKET}-backup.zip"

# Solo se usa para volver a subir el zip a un bucket
#DESTINATION_BUCKET="ofl-development-admin-web"

# Carpeta con el contenido
mkdir -p $LOCAL_FOLDER

# Sincronizar S3 con carpeta LOCAL_FOLDER
aws s3 sync s3://$SOURCE_BUCKET $LOCAL_FOLDER

# Crear un archivo zip del contenido descargado
cd $SCRIPT_DIR
zip -r $ZIP_FILE $SOURCE_BUCKET

# Borrar carpeta
rm -rf $LOCAL_FOLDER
