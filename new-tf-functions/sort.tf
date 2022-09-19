# provider "aws" {
#     region = "ap-south-1"
  
# }
# resource "aws_instance" "sort-instances" {
#     ami =   "ami-06489866022e12a14"
#     instance_type = "t2.micro"
# }

# locals {
#  name = sort(["production", "testing", "application", "design"]) 
# }



# output "Application_IP" {
#   value = aws_instance.sort-instances.id

# }
# output "sorted_names" {
#     value = aws_instance.sort-instances.Name
  
# }
