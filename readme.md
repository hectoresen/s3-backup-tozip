Configurar cli aws

```bash
aws configure
```

Instalar zip para Debian/Ubuntu:

```bash
sudo apt-get update
sudo apt-get install zip
```

Si tu bucket S3 no está en la región por defecto que configuraste durante aws configure, puedes especificar la región en los comandos de AWS CLI añadiendo --region <region>:

Reemplaza <region> con la región correcta, como us-west-2.

```bash
aws s3 sync s3://$SOURCE_BUCKET $LOCAL_FOLDER --region <region>
aws s3 cp $ZIP_FILE s3://$DESTINATION_BUCKET/$(basename $ZIP_FILE) --region <region>
```

Permisos de ejecución:
```bash
chmod +x download-bucket.s3.sh
```

Ejecución
```bash
sh ./download-bucket.s3.sh
```


Variables
```
# Variables
SOURCE_BUCKET="xxx"
SCRIPT_DIR=$(pwd)
LOCAL_FOLDER="$SCRIPT_DIR/$SOURCE_BUCKET"
ZIP_FILE="$SCRIPT_DIR/${SOURCE_BUCKET}-backup.zip"
```