terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-east-1"
}

resource "aws_instance" "app_server" {
  key_name = "iac-alura"
  ami           = "ami-080e1f13689e07408"
  instance_type = "t2.micro"
  user_data_replace_on_change = true
  # user_data =<<-EOT
  #   ${file("${path.module}/user_data.sh")}
  # EOT 

  tags = {
    Name = "Automatizando processos"
  }
}