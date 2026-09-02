# Evaluación Parcial N° 1: Infraestructura como Código (IaC)

## Información General

<<<<<<< HEAD
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
=======
* **Asignatura:** Infraestructura como Código I (AUY1103)
* **Tiempo Asignado:** 5 Horas pedagógicas
* **Ponderación:** 20%
* **Modalidad:** Ejecución práctica / Entrega de encargo (Individual)
* **Lugar:** Laboratorio TAITE 09

---

## Descripción General

En esta evaluación, el estudiante debe llevar a cabo la implementación básica de un proyecto utilizando **Terraform** en **AWS** y entregar las evidencias correspondientes a la ejecución.

El objetivo es desplegar una arquitectura básica para un **servicio LAMP** compuesto por tres componentes principales:
1. **S3 Bucket:** Para el almacenamiento de imágenes y contenido estático.
2. **Servidor Web (EC2):** Servidor de presentación con Apache.
3. **Base de Datos (RDS MySQL):** Base de datos que alimenta la aplicación.
>>>>>>> b136a6e31dac2b4337b020f14bde2f0a6ea8395f

---

## Indicadores de Logro Evaluados

<<<<<<< HEAD
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

=======
* **IL2.1:** Utiliza comandos clave de Terraform para gestionar la infraestructura y controlar el ciclo de vida completo de esta.
* **IL2.3:** Utiliza los backends de Terraform para asegurar la integridad y consistencia de la infraestructura, corrigiendo cualquier discrepancia que pueda detectarse en comparación al estado actual de la infraestructura.

---

## Instrucciones Específicas

### Contexto
Usted ha sido contratado como Ingeniero en Plataformas en una empresa de servicios TI. Uno de los estándares de la empresa es estandarizar todos los despliegues de clientes utilizando Terraform. Su primer encargo es implementar la infraestructura para un servicio LAMP en AWS.

---

### Etapas del Proyecto

#### Etapa 1: Creación de Terraform Base y Ambiente de Trabajo
1. Configurar las credenciales de AWS para el uso de Terraform.
2. Generar el script básico de Terraform (iniciando desde cero o a partir del template entregado por el docente).
3. Configurar la VPC a utilizar (pudiendo usar la VPC por defecto/existente o creando una nueva).
4. Configurar el **backend de Terraform** para el almacenamiento correcto y seguro del archivo de estado (`.tfstate`).

#### Etapa 2: Implementación de Recursos mediante Terraform
1. **S3 Bucket:**
   * Crear un bucket S3 para contenido estático e imágenes.
   * Asignar un nombre acorde a su función.
   * Configurar el acceso público adecuado para visualizar las imágenes.
2. **Servidor Base de Datos (RDS MySQL):**
   * Crear una instancia de base de datos MySQL.
   * Configurar especificaciones lo más cercanas posible a **2 vCPU y 4 GB de RAM** (ej. `db.t3.medium` o la instancia disponible según cuota/Academy).
   * Asignar un nombre adecuado a la base de datos.
   * Permitir accesibilidad pública (IP pública) y configurar el grupo de seguridad correspondiente.
3. **Servidor Web (EC2 Linux):**
   * Desplegar una instancia EC2 con una distribución Linux (CentOS, RedHat, Debian, Amazon Linux, etc.).
   * Configurar mediante `user_data` o aprovisionamiento el servicio de servidor web **Apache (`httpd` / `apache2`)**.
   * El sitio web debe mostrar al ingresar:
     * **Nombre del estudiante**
     * **RUT del estudiante**

#### Etapa 3: Validación y Pruebas
1. Ejecutar el ciclo de vida completo con Terraform (`terraform init`, `terraform plan`, `terraform apply`).
2. Validar que la ejecución se complete sin errores.
3. Validar el acceso remoto a la base de datos RDS MySQL desde un cliente/IDE como MySQL Workbench, DBeaver u otro, utilizando las credenciales creadas.
4. Validar el acceso vía navegador web al sitio HTTP desplegado en la instancia EC2.
5. Cargar una imagen en el bucket S3 y verificar que sea accesible públicamente desde un navegador web.

---

## Productos a Entregar

* **Código Fuente:** Scripts de Terraform (`.tf`).
* **Credenciales / Variables:** Configuración de variables empleadas (sin exponer llaves privadas críticas).
* **Archivo de Estado:** Estado de Terraform (`terraform.tfstate` o evidencia del backend configurado).
* **Plataforma de Entrega:** Subir el encargo a través del sistema **AVA**.

---

## Pauta de Evaluación (Rúbrica)

| Indicador de Evaluación | % Ponderación | Descripción Destacada (100% / Muy Buen Desempeño) |
| :--- | :---: | :--- |
| **IE 2.1.1** | **30%** | Utiliza de manera efectiva una amplia gama de comandos para crear, modificar y eliminar recursos en la nube según sea necesario. Además, explica claramente la funcionalidad y la aplicación de cada comando utilizado. |
| **IE 2.1.2** | **30%** | Controla el ciclo de vida completo de la infraestructura utilizando Terraform. Comprende y aplica correctamente los procesos de aprovisionamiento, actualización y desmantelamiento de recursos, asegurando la coherencia y la integridad en todas las etapas. |
| **IE 2.2.1** | **10%** | Configura de manera completa y precisa los backends, asegurando un almacenamiento adecuado y accesible del archivo de estados. |
| **IE 2.2.2** | **10%** | Verifica de forma exhaustiva y frecuente el archivo de estados, asegurando su correcta actualización y registrando cualquier cambio con detalles precisos. |
| **IE 2.3.1** | **10%** | Utiliza backends de Terraform de manera óptima para almacenar el estado de la infraestructura. El backend configurado asegura la integridad y consistencia de la infraestructura con la configuración documentada. |
| **IE 2.3.2** | **10%** | Corrige todas las discrepancias entre el estado actual de la infraestructura y el estado almacenado en el backend, asegurando que la infraestructura esté siempre en un estado consistente. |
| **Total** | **100%** | |

---

# ANEXO: Guía Paso a Paso para Ejecución en AWS Academy

Debido a que el entorno **AWS Academy Learner Lab** posee restricciones de permisos (roles IAM predefinidos y cuotas de servicio), a continuación se presenta la guía detallada paso a paso para ejecutar esta evaluación de forma exitosa.

---

## Paso 1: Iniciar el Entorno en AWS Academy

1. Ingrese a la plataforma de **AWS Academy**.
2. Diríjase a su curso y acceda a **Learner Lab**.
3. Haga clic en el botón **Start Lab**. Espere a que el círculo junto a "AWS" cambie a color **verde**.
4. Haga clic en **AWS Details**.
5. En la sección **AWS CLI**, haga clic en `Show` para ver las credenciales temporales.

---

## Paso 2: Obtener las Credenciales de AWS en AWS CloudShell o Terminal Local

### Opción A: Usando AWS CloudShell (Recomendado)
1. En la consola de AWS, abra **AWS CloudShell** (ícono de terminal en la barra superior).
2. CloudShell ya viene con las credenciales del laboratorio y `aws-cli` configurados automáticamentes.

### Opción B: Usando Terminal Local o AWS CLI
1. Copie las credenciales mostradas en **AWS Details** (`aws_access_key_id`, `aws_secret_access_key`, `aws_session_token`).
2. Guárdelas en su archivo local `~/.aws/credentials` o expórtelas en su terminal:
   ```bash
   export AWS_ACCESS_KEY_ID="ASIA..."
   export AWS_SECRET_ACCESS_KEY="..."
   export AWS_SESSION_TOKEN="..."
   export AWS_DEFAULT_REGION="us-east-1"
   ```

> **Nota AWS Academy:** En AWS Academy, siempre debe utilizar el rol existente llamado `LabRole` para la creación de recursos o adjuntarlo a instancias EC2 si fuera necesario.

---

## Paso 3: Instalación y Configuración Inicial de Terraform

Si está en AWS CloudShell o en una máquina Linux propia:

```bash
# Descargar e instalar Terraform (Amazon Linux / CentOS)
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install terraform

# Verificar la instalación
terraform -v
```

Cree un directorio para el proyecto:
```bash
mkdir evaluacion-terraform
cd evaluacion-terraform
```

---

## Paso 4: Creación de la Estructura de Archivos Terraform

Cree los siguientes archivos dentro de la carpeta:

### 1. `provider.tf`
```hcl
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}
```

---

### 2. `network.tf` (Uso de VPC por defecto para AWS Academy)
```hcl
# Obtener la VPC por defecto asignada en el Learner Lab
data "aws_vpc" "default" {
  default = true
}

# Obtener las subredes de la VPC por defecto
data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

# Grupo de seguridad para Servidor Web y Base de Datos
resource "aws_security_group" "lamp_sg" {
  name        = "lamp-security-group"
  description = "Permitir HTTP, SSH y MySQL"
  vpc_id      = data.aws_vpc.default.id

  # HTTP para el sitio Web
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # SSH para administración
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # MySQL para conexión desde IDE / Externa
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
```

---

### 3. `s3.tf` (Bucket S3 para Imágenes)
```hcl
resource "aws_s3_bucket" "images_bucket" {
  bucket        = "mi-evaluacion-lamp-imagenes-12345" # Cambiar por un nombre único global
  force_destroy = true
}

resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket = aws_s3_bucket.images_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "public_policy" {
  depends_on = [aws_s3_bucket_public_access_block.public_access]
  bucket     = aws_s3_bucket.images_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.images_bucket.arn}/*"
      }
    ]
  })
}
```

---

### 4. `rds.tf` (Base de Datos MySQL)
> **Nota AWS Academy:** Debido a cuotas de laboratorio, `db.t3.micro` o `db.t4g.micro` son las instancias soportadas en la capa gratuita/Learner Lab.

```hcl
resource "aws_db_subnet_group" "default" {
  name       = "main-subnet-group"
  subnet_ids = data.aws_subnets.default.ids
}

resource "aws_db_instance" "mysql_db" {
  allocated_storage      = 20
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t3.micro" # O la instancia permitida por la cuota de AWS Academy
  db_name                = "lampdb"
  username               = "adminuser"
  password               = "AdminPassword123!" # Usar credencial segura
  publicly_accessible    = true
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.lamp_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.default.name
}
```

---

### 5. `ec2.tf` (Servidor Web Apache)
```hcl
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }
}

resource "aws_instance" "web_server" {
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = "t2.micro"
  subnet_id                   = data.aws_subnets.default.ids[0]
  vpc_security_group_ids      = [aws_security_group.lamp_sg.id]
  associate_public_ip_address = true

  # Script para instalar Apache y desplegar Nombre y RUT
  user_data = <<-EOF
              #!/bin/bash
              dnf update -y
              dnf install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "<h1>Evaluacion Parcial N1 - Infraestructura como Codigo</h1>" > /var/www/html/index.html
              echo "<p><strong>Estudiante:</strong> Juan Perez</p>" >> /var/www/html/index.html
              echo "<p><strong>RUT:</strong> 12.345.678-9</p>" >> /var/www/html/index.html
              EOF

  tags = {
    Name = "Servidor-Web-LAMP"
  }
}
```

---

### 6. `outputs.tf`
```hcl
output "web_public_ip" {
  description = "IP Publica del Servidor Web"
  value       = aws_instance.web_server.public_ip
}

output "web_url" {
  value = "http://${aws_instance.web_server.public_ip}"
}

output "rds_endpoint" {
  description = "Endpoint de la Base de Datos MySQL"
  value       = aws_db_instance.mysql_db.endpoint
}

output "s3_bucket_name" {
  description = "Nombre del Bucket S3"
  value       = aws_s3_bucket.images_bucket.id
}
```

---

## Paso 5: Ejecución y Despliegue de la Infraestructura

1. **Inicializar Terraform:**
   ```bash
   terraform init
   ```
2. **Validar la Sintaxis:**
   ```bash
   terraform validate
   ```
3. **Generar el Plan de Ejecución:**
   ```bash
   terraform plan
   ```
4. **Aplicar la Infraestructura:**
   ```bash
   terraform apply -auto-approve
   ```

---

## Paso 6: Validación de los Recursos Criados

1. **Servidor Web:**
   * Ingrese desde su navegador a la dirección URL mostrada en el output `web_url` (ej: `http://1.2.3.4`).
   * Verifique que se muestre su **Nombre** y **RUT**.
2. **Base de Datos RDS:**
   * Abra **DBeaver** o **MySQL Workbench**.
   * Cree una nueva conexión MySQL con:
     * **Host:** El valor entregado en `rds_endpoint` (sin el puerto `:3306`).
     * **Port:** `3306`
     * **User:** `adminuser`
     * **Password:** `AdminPassword123!`
   * Pruebe la conexión.
3. **Bucket S3:**
   * Suba una imagen de prueba al bucket utilizando AWS CLI:
     ```bash
     aws s3 cp imagen_prueba.jpg s3://$(terraform output -raw s3_bucket_name)/imagen_prueba.jpg
     ```
   * Acceda mediante el navegador web a:
     `https://<s3_bucket_name>.s3.amazonaws.com/imagen_prueba.jpg` y confirme su visualización.

---

## Paso 7: Limpieza de Recursos (Opcional al finalizar)

Para evitar el consumo no deseado de créditos en AWS Academy:
```bash
terraform destroy -auto-approve
```
>>>>>>> b136a6e31dac2b4337b020f14bde2f0a6ea8395f
