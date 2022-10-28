provider "aws" {
    region = "ap-south-1"
}

resource "aws_instance" "APS1-EC2-workspace" {
    ami = var.aws_ami 
    instance_type = var.instance_type
    tags = {
      Name = local.instance_name
    }
}

resource "aws_vpc" "APS1-main-vpc" {
    cidr_block = var.cidr_block
    tags  = {
        Name = local.vpc_name
    }
}

