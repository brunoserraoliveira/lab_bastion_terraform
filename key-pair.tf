resource "aws_key_pair" "key_pair" {
  key_name   = "key-terraform"
  public_key = file("key-terraform.pub")
}

