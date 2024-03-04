terraform {
  backend "s3" {
    bucket = "<colocar-nome-bucket>" # example: terraform-tfstates
    key    = "sonarqube/terraform.tfstate"
    region = "<colocar-regiao>"  # example: us-east-1 (região escolhida na criação do bucket)
  }
}

provider "aws" {
    profile = "default" # trocar pelo profile que tiver, ou retirar se utilizar o aws configure sem um profile
  region = var.regionDefault

  default_tags {
    tags = var.tags
  }
}
