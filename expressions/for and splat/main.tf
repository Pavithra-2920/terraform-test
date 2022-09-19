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