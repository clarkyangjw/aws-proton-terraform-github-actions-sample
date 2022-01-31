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