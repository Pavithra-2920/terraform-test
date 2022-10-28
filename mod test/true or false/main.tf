 provider "aws" {
    region = "ap-south-1"
}
 resource "aws_instance" "APS1-trial-instance" {
    ami = "ami-01216e7612243e0ef"
    instance_type = "t2.micro"
    key_name = var.key_name_tf
    count = var.instancecheck == true ? 2 : 0
 tags ={
    Name = "Terraform-Ec2-DEV-${count.index+1}"
    Department ="development"
    Environment = "aws"
}
}
output "aws_instance_ip" {
  value = aws_instance.APS1-trial-instance[*].private_ip #(splat)
}
resource "aws_instance" "APS1-main-instance" {
    ami = "ami-064687fa05edcd686"
    instance_type = "t2.micro"
    key_name = var.key_name_tf
    count =  var.instancecheck == false ? 2 : 0
 tags ={
    Name ="Terraform-Ec2-PROD-${count.index+1}"
    Department ="production"
    Environment = "aws"
}
}
output "aws_machine_ip" {
  value = aws_instance.APS1-main-instance[*].private_ip #(splat)
}
