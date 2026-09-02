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
