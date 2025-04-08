#!/bin/bash

read -p "Introduce el nombre del bucket S3 a respaldar: " SOURCE_BUCKET

if [ -z "$SOURCE_BUCKET" ]; then
  echo "❌ Error: El nombre del bucket no puede estar vacío."
  exit 1
fi

SCRIPT_DIR=$(pwd)
LOCAL_FOLDER="$SCRIPT_DIR/$SOURCE_BUCKET"
ZIP_FILE="$SCRIPT_DIR/${SOURCE_BUCKET}-backup.zip"

mkdir -p $LOCAL_FOLDER

echo "🔄 Descargando contenido de s3://$SOURCE_BUCKET ..."
aws s3 sync s3://$SOURCE_BUCKET $LOCAL_FOLDER

echo "📦 Comprimiendo contenido en $ZIP_FILE ..."
cd $SCRIPT_DIR
zip -r "$ZIP_FILE" "$SOURCE_BUCKET"

echo "🧹 Limpiando carpeta temporal..."
rm -rf "$LOCAL_FOLDER"

echo "✅ Backup completado: $ZIP_FILE"
