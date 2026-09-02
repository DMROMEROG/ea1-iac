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
