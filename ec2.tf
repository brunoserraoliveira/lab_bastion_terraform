# Instância EC2 na subnet pública (subnet_1)
resource "aws_instance" "ec2_public" {
  ami                         = "ami-066784287e358dad1"
  instance_type               = "t3.micro"
  key_name                    = aws_key_pair.key_pair.key_name
  subnet_id                   = aws_subnet.subnet_1.id  # Subnet pública
  vpc_security_group_ids      = [aws_security_group.sg.id]
  iam_instance_profile        = aws_iam_instance_profile.role_ssm_instance_profile.name
  associate_public_ip_address = true  # Atribui um IP público
  user_data                   = file("./docs/userdata.sh")

  tags = {
    Name = "lab_formacao_aws_public"
  }

  root_block_device {
    volume_type = "gp3"
    volume_size = 12
  }
}

# Instância EC2 na subnet privada (subnet_2)
resource "aws_instance" "ec2_private" {
  ami                         = "ami-066784287e358dad1"
  instance_type               = "t3.micro"
  key_name                    = aws_key_pair.key_pair.key_name
  subnet_id                   = aws_subnet.subnet_2.id  # Subnet privada
  vpc_security_group_ids      = [aws_security_group.sg.id]
  iam_instance_profile        = aws_iam_instance_profile.role_ssm_instance_profile.name
  associate_public_ip_address = false  # Sem IP público
  user_data                   = file("./docs/userdata.sh")

  tags = {
    Name = "lab_formacao_aws_private"
  }

  root_block_device {
    volume_type = "gp3"
    volume_size = 12
  }
}
