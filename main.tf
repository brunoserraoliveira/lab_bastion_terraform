terraform {
  
  required_version = "1.9.5"
  
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.65.0"
    }
  }

    backend "s3" {
    bucket = "terraformlabsformacaoaws"
    key    = "lab_bastion/terraform.tfstate"
    region = "us-east-1"
  }

}

provider "aws" {
  
 region = "us-east-1"

 default_tags {
   tags = {
     owner = "brunooliver"
     managed-by = "terraform"
   }
 }

}

