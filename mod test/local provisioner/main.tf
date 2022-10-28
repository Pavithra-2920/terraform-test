provider "aws" {
   region     = "ap-south-1"
   
}
resource "aws_instance" "APS1_ec2_local" {
    ami = "ami-00a2ea0777b445307"  
    instance_type = "t2.micro" 
    tags = {
        Name = "Terraform EC2"
    }

  provisioner "local-exec" {
    command = "echo ${self.private_ip} >> private_ips.txt"
  }
}
