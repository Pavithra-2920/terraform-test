provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "ec2-1" {
    ami= var.ami
    instance_type = var.instance_type
    count = var.condition == true ? 2 : 0
    tags = {
        Name = "ec2-prod"
    }
}
resource "aws_instance" "ec2-2" {
    ami    = var.ami 
    instance_type = var.instance_type
    count = var.condition == false ? 1 : 0
    tags = {
        Name = "ec2-dev"
    }
}
output "instance_ip_addr" {
    value = aws_instance.ec2-1[*].public_ip
}

################################################################################################3
resource "aws_vpc" "UE1-vpc" {
  cidr_block        = "10.2.0.0/16"
  instance_tenancy  = "default"
    tags = {
      "Name"    = "application-vpc"
      "App-name"= "my-app"
      "Region"  = "us-east-1"
    }
    count = "${var.environment == "prod" ? 2 : 0 }"
}

output "application-output" {
    value = aws_vpc.UE1-vpc[*].arn
}
