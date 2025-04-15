#!/bin/bash

read -p "Introduce la ruta de la carpeta madre: " LOCAL_PARENT_FOLDER
read -p "Introduce el nombre del bucket S3 de destino: " DEST_BUCKET

if [ -z "$LOCAL_PARENT_FOLDER" ] || [ -z "$DEST_BUCKET" ]; then
  echo "❌ Error: La ruta local y el nombre del bucket no pueden estar vacíos."
  exit 1
fi

LOCAL_PARENT_FOLDER="${LOCAL_PARENT_FOLDER%/}"

if [ ! -d "$LOCAL_PARENT_FOLDER" ]; then
  echo "❌ Error: La carpeta '$LOCAL_PARENT_FOLDER' no existe."
  exit 1
fi

echo "🚀 Subiendo contenido de $LOCAL_PARENT_FOLDER a s3://$DEST_BUCKET ..."

aws s3 sync "$LOCAL_PARENT_FOLDER/" "s3://$DEST_BUCKET/"

echo "✅ Subida completada."
