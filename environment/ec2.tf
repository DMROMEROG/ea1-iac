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
