# Evaluación Parcial N° 1: Infraestructura como Código (IaC)

## Información General

- Asignatura: Infraestructura como Código I (AUY1103)
- Tiempo asignado: 5 horas pedagógicas
- Ponderación: 20%
- Modalidad: Ejecución práctica / entrega de encargo (individual)
- Lugar: Laboratorio TAITE 09

---

## Descripción del Proyecto

Este proyecto implementa una infraestructura básica de servicios web en AWS usando Terraform. La solución contempla la creación de los siguientes componentes:

1. S3 bucket para almacenamiento de imágenes y contenido público.
2. Instancia EC2 con Apache para desplegar un sitio web.
3. Base de datos RDS MySQL para soportar la aplicación.
4. Red y seguridad mínima compatible con AWS Academy Learner Lab.

La finalidad de la práctica es demostrar el uso de IaC para provisionar, validar y limpiar infraestructura cloud mediante Terraform.

---

## Estructura del Proyecto

```text
EA1-IaC1/
├── environment/              # Archivos Terraform de infraestructura
│   ├── provider.tf
│   ├── network.tf
│   ├── ec2.tf
│   ├── rds.tf
│   ├── s3.tf
│   └── outputs.tf
├── doc/                      # Documentación y entregables del proyecto
├── Evidence/                 # Evidencias de ejecución y validación
├── README.md                 # Documento principal del proyecto
├── .gitignore
└── terraform.tfstate*        # Estado de Terraform (si aplica)
```

---

## Objetivos

- Configurar correctamente un entorno de trabajo en AWS Academy.
- Crear infraestructura como código con Terraform.
- Automatizar la creación de recursos de red, seguridad, servidor web y base de datos.
- Validar el despliegue mediante acceso web y conexiones a la base de datos.
- Mantener una estructura ordenada para la entrega final de evidencia.

---

## Requisitos Previos

Antes de ejecutar el proyecto, debes contar con:

- Una cuenta activa en AWS Academy Learner Lab.
- Acceso a AWS CLI o AWS CloudShell.
- Terraform instalado en tu entorno.
- Permisos que permitan crear instancias EC2, S3, RDS y grupos de seguridad.

---

## Instrucciones Generales

Sigue esta secuencia para completar la entrega del proyecto:

1. Configura las credenciales de AWS y valida el acceso al laboratorio.
2. Revisa la carpeta `environment/` y verifica que los archivos Terraform estén correctos.
3. Ejecuta `terraform init` para inicializar el proyecto.
4. Ejecuta `terraform plan` para revisar el plan de infraestructura.
5. Ejecuta `terraform apply` para desplegar la infraestructura en AWS.
6. Valida el sitio web, la base de datos y el bucket S3.
7. Registra las evidencias de ejecución dentro de la carpeta `Evidence/`.
8. Cuando termines, limpia los recursos con `terraform destroy` si corresponde.

---

## Arquitectura Propuesta

La infraestructura desplegada incluye:

- VPC por defecto de AWS Academy
- Subredes asociadas a la VPC
- Grupo de seguridad con permisos para HTTP, SSH y MySQL
- Instancia EC2 Amazon Linux con Apache (`httpd`)
- Base de datos RDS MySQL
- Bucket S3 público para almacenamiento de imágenes
- Outputs para IP pública del servidor, endpoint RDS y nombre del bucket

---

## Pasos de Ejecución

### Paso 1: Iniciar el entorno en AWS Academy

1. Ingresa a AWS Academy.
2. Accede al curso y abre Learner Lab.
3. Haz clic en `Start Lab` y espera a que el estado de AWS quede activo.
4. Desde `AWS Details`, revisa las credenciales temporales.

### Paso 2: Configurar credenciales de AWS

#### Opción A: AWS CloudShell

CloudShell ya trae configuradas las credenciales del laboratorio y no requiere configuración adicional.

#### Opción B: Terminal local

Exporta las credenciales temporales:

```bash
export AWS_ACCESS_KEY_ID="ASIA..."
export AWS_SECRET_ACCESS_KEY="..."
export AWS_SESSION_TOKEN="..."
export AWS_DEFAULT_REGION="us-east-1"
```

> Nota: En AWS Academy, se recomienda usar el rol `LabRole` cuando sea posible.

### Paso 3: Instalar Terraform

```bash
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install terraform
terraform -v
```

### Paso 4: Crear la estructura del proyecto

```bash
mkdir EA1-IaC1
cd EA1-IaC1
mkdir -p environment doc Evidence
```

### Paso 5: Definir la infraestructura Terraform

Dentro de `environment/`, crear los siguientes archivos:

- `provider.tf`
- `network.tf`
- `s3.tf`
- `rds.tf`
- `ec2.tf`
- `outputs.tf`

### Paso 6: Inicializar y desplegar

```bash
cd environment
terraform init
terraform validate
terraform plan
terraform apply -auto-approve
```

### Paso 7: Validar la infraestructura

1. Accede al sitio web desde la IP pública del EC2.
2. Confirma que el contenido del sitio se muestre correctamente.
3. Conéctate a la base de datos RDS desde MySQL Workbench o DBeaver.
4. Verifica el acceso al bucket S3 e imagen pública.

### Paso 8: Limpieza final

```bash
terraform destroy -auto-approve
```

---

## Archivos Terraform y su Función

### `provider.tf`
Configura el proveedor de AWS y la región principal del despliegue.

### `network.tf`
Obtiene la VPC y subredes por defecto, además de definir el grupo de seguridad.

### `s3.tf`
Crea el bucket S3 y configura acceso público para visualizar contenido.

### `rds.tf`
Define la instancia RDS MySQL con almacenamiento, credenciales y acceso público.

### `ec2.tf`
Despliega la instancia EC2 con Amazon Linux y configura Apache mediante `user_data`.

### `outputs.tf`
Muestra información útil al final del despliegue: IP pública, URL, endpoint RDS y nombre bucket.

---

## Validación de Resultados Esperados

El proyecto será exitoso si:

- La instancia EC2 queda creada y responde en HTTP.
- El sitio web muestra nombre y RUT del estudiante.
- La base de datos MySQL queda accesible desde un cliente externo.
- El bucket S3 queda operativo y es accesible públicamente.
- El archivo de estado de Terraform se mantiene consistente.

---

## Evidencias a Registrar

Se recomienda guardar en `Evidence/`:

- Capturas del `terraform plan`
- Capturas de `terraform apply`
- Pantalla del navegador con el sitio web funcionando
- Capturas de acceso a la base de datos
- Evidencia de visualización del bucket S3
- Documentación adicional necesaria para la entrega

---

## Indicadores de Logro Evaluados

- IL2.1: Uso de comandos clave de Terraform para gestionar el ciclo de vida de la infraestructura.
- IL2.3: Uso de backends y validación del estado de la infraestructura para mantener consistencia.

---

## Criterios de Evaluación

| Indicador | Ponderación | Descripción |
| :--- | :---: | :--- |
| IE 2.1.1 | 30% | Uso efectivo de comandos de Terraform para crear, modificar y eliminar recursos. |
| IE 2.1.2 | 30% | Control del ciclo de vida completo de la infraestructura. |
| IE 2.2.1 | 10% | Configuración correcta del backend y almacenamiento del estado. |
| IE 2.2.2 | 10% | Verificación y actualización del estado de Terraform. |
| IE 2.3.1 | 10% | Uso adecuado de backends para mantener la integridad del estado. |
| IE 2.3.2 | 10% | Corrección de discrepancias entre estado real y estado deseado. |

---

## Consideraciones de Seguridad

Este proyecto está orientado a una práctica académica y a AWS Academy. Sin embargo, en entornos reales se recomienda:

- No exponer credenciales en archivos de código.
- Usar variables de entorno o archivos seguros para secretos.
- Restrigir el acceso a puertos abiertos.
- Evitar la exposición pública innecesaria de recursos.
- Mantener encriptación y políticas IAM mínimas.

---

## Conclusión

Este repositorio demuestra la creación de una infraestructura básica en AWS utilizando Terraform, enfocada en un escenario LAMP con EC2, RDS y S3. El objetivo principal es evidenciar el uso de IaC como práctica de automatización, validación y entrega de infraestructura cloud.

