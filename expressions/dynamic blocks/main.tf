provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "prod" {
    cidr_block = "192.168.0.0/16"
} 

resource "aws_security_group" "aws_sg" {
    name = "UE1_SG"
    vpc_id = "${aws_vpc.prod.id}"

dynamic "ingress" {
    for_each = local.ingress_rules
    content {
        description = ingress.value.description
        from_port   = ingress.value.port
        to_port     = ingress.value.port
        protocol    = "tcp"
        cidr_blocks  = ["0.0.0.0/0"]
        }
}

    tags = {
        Name = "prod_UE1_SG"
    }
}