provider "aws" {
  region = "ap-south-1"
}

data "aws_secretsmanager_secret_version" "creds" {
  secret_id = "APS1-demo-credentials"
}

locals {
   APS1-demo-credentials= jsondecode(
    data.aws_secretsmanager_secret_version.creds.secret_string
  )
}

resource "aws_instance" "APS1-demo" {
    
    instance_type = "t2.micro"
    key_name = local.APS1-demo-credentials.keypair
    ami = local.APS1-demo-credentials.AMI
    tags = var.testing_environment
}

