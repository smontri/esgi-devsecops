output "region" {
  description = "AWS region"
  value       = var.region
}

output "ec2instance_ip" {
  value = aws_instance.ci-cd_instance.public_ip
}
