terraform {
  backend "s3" {
    bucket = "<colocar-nome-bucket>"
    key    = "sonarqube/terraform.tfstate"
    region = "<colocar-regiao>"
  }
}

provider "aws" {
    profile = "default"
  region = var.regionDefault

  default_tags {
    tags = var.tags
  }
}