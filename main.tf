# The configuration for the `remote` backend.
terraform {
    backend "remote" {
        # The name of your Terraform Cloud organization.
        organization = "learningterraformclark"

        # The name of the Terraform Cloud workspace to store Terraform state files in.
        workspaces {
            name = "aws-proton-terraform-github-actions-sample"
        }
    }
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 3.73"
        }
    }
    required_version = ">= 0.14.9"
}
provider "aws" {
    profile = "default"
    region  = "us-east-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-03a0c45ebc70f98ea"
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name
  }
}