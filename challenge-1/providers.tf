provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket         = "neohome-tf-12345678"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "NeoHome-tf"
  }
}
