resource "aws_iam_role" "role-ssm" {
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Action = "sts:AssumeRole"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
  })
  
  description           = "Role acesso ssm para instancia EC2"
  force_detach_policies = false
  managed_policy_arns   = ["arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"]
  max_session_duration  = 3600
  name                  = "role-ssm"
  path                  = "/"
  tags                  = {}
}

resource "aws_iam_instance_profile" "role_ssm_instance_profile" {
  name = "role-ssm-instance-profile"
  role = aws_iam_role.role-ssm.name  
}
