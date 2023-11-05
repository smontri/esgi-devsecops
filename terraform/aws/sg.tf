#########
# Security group configuration

resource "aws_security_group" "ci-cd_sg" {
  description = "Security group to allow SSH and Jenkins + Sonarqube"
  name   = "HTTP and SSH"
  vpc_id = aws_vpc.ci-cd_vpc.id

  ingress {
    description = "Trafic through port 8080"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    description = "Trafic through port 8090"
    from_port   = 8090
    to_port     = 8090
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Trafic through port 9000"
    from_port   = 9000
    to_port     = 9000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Trafic through port 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound trafic"
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}