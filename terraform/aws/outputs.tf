output "region" {
  description = "AWS region"
  value       = var.region
}

output "ec2instance_ip" {
  value = aws_instance.jpetstore_instance.public_ip
}
