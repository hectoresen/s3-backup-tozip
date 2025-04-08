## Backup de un bucket S3 como archivo `.zip`

Este script descarga el contenido de un bucket S3 y lo comprime en un archivo `.zip` local.

---

### ⚙️ Configurar CLI de AWS

Asegúrate de tener configurado el CLI de AWS:

```bash
aws configure
```

---

### 📦 Instalar `zip` en Debian/Ubuntu

```bash
sudo apt-get update
sudo apt-get install zip
```

---

### 🌍 Buckets en otra región

Si tu bucket S3 **no está en la región por defecto** que configuraste con `aws configure`, puedes especificar la región en los comandos de AWS CLI añadiendo `--region <region>`:

Reemplaza `<region>` con la región correcta, como `us-west-2`.

```bash
aws s3 sync s3://$SOURCE_BUCKET $LOCAL_FOLDER --region <region>
aws s3 cp $ZIP_FILE s3://$DESTINATION_BUCKET/$(basename $ZIP_FILE) --region <region>
```

---

### 🔐 Permisos de ejecución

Solo la primera vez:

```bash
chmod +x download-bucket.s3.sh
```

---

### 🚀 Ejecución

Lanza el script:

```bash
./download-bucket.s3.sh
```

Se te pedirá que introduzcas el nombre del bucket que quieres respaldar.

---
