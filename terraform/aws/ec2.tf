resource "aws_instance" "ci-cd_instance" {
  ami           = "ami-00983e8a26e4c9bd9"
  instance_type = "t2.large"
  key_name      = "ci-cd"

  subnet_id                   = aws_subnet.ci-cd_subnet.id
  vpc_security_group_ids      = [aws_security_group.ci-cd_sg.id]
  associate_public_ip_address = true

  root_block_device {
    delete_on_termination = true
    volume_size           = 30
    volume_type           = "gp2"
    encrypted             = true
  }

  tags = {
    "Name" : "ci-cd instance"
  }
}