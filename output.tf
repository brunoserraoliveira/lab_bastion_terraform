output "instance_public_ip" {
  description = "O IP público da instância EC2"
  value       = aws_instance.ec2_public.public_ip
}

output "instance_id" {
  description = "O ID da instância EC2"
  value       = aws_instance.ec2_public.id
}