terraform {    
  backend "s3" {
    bucket = "akanni-terraform-backend"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
    use_lockfile = true
  }

  required_providers {
    aws = {
        source  = "hashicorp/aws"
        version = "~>6.0"
    }
  }  
}

provider "aws" {
    region = "us-east-1"
}

resource "aws_s3_bucket" "example" {
  bucket = "akanni-tf-test-20260623-001"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}  
