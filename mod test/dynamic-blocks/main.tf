provider "aws" {
  region= "ap-south-1"
}

resource "aws_vpc" "APS1_default_vpc" {
  cidr_block       = "10.4.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "APS1-test-vpc"
  }
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.APS1_default_vpc.id


  dynamic "ingress" {
    for_each = var.web_ingress
      content {
        description = "TLS from VPC"
        from_port = ingress.value.port
        to_port = ingress.value.port
        protocol = ingress.value.protocol
        cidr_blocks = ingress.value.cidr_blocks
     }
  }
    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}
  
