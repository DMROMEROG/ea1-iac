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
