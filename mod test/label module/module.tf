provider "aws" {
  region= "ap-south-1"
}
module "ec2_abc_label" {
  source = "cloudposse/label/terraform"
  
  namespace  = "eg"
  stage      = "prod"
  name       = "prod-EC2"
  attributes = ["public"]
  delimiter  = "-"

  tags = {
    "BusinessUnit" = "XYZ",
    "Snapshot"     = "true"
  }
}

# resource "aws_security_group" "eg_prod_bastion_abc" {
#   name = module.eg_prod_bastion_abc_label.id
#   tags = module.eg_prod_bastion_abc_label.tags
#   ingress {
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }



resource "aws_instance" "ec2_abc_label" {
  instance_type          = "t2.micro"
  ami =   "ami-06489866022e12a14"
  tags                   = module.ec2_abc_label.tags
#   vpc_security_group_ids = [aws_security_group.eg_prod_bastion_abc.id]
  }