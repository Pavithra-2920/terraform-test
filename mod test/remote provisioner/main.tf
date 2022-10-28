provider "aws" {
    region = "ap-south-1"
}
resource "aws_instance" "ec2_example" {

    ami = "ami-061183ad486d5dd8a"  
    instance_type = var.instance_type 
    key_name= var.key_name
    tags = {
        Name = "Demo_Ec2"
           }
        

  provisioner "remote-exec" {
    inline = [
      "touch hello.txt",
      "echo helloworld remote provisioner >> hello.txt",
    ]
  }
  connection {
		type        = "ssh"
		host        = self.public_ip
		user        = "linux"
		private_key = file("C:/Users/Pavithra S/Downloads/demo-aps1.pem")
		timeout     = "2m"
	}
}
resource "aws_security_group" "main" {
  name        = "ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = "vpc-050185ed1ffef2bf8"

ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "TCP"
    security_groups  = []
    cidr_blocks      = ["0.0.0.0/0", ]
    description      = ""
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    self             = false
    }

egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0", ]
    description      = ""
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    security_groups  = []
    self             = false
    }

}
output "instance-ip" {
  value= aws_instance.ec2_example.private_ip
}

# resource "aws_key_pair" "deployer" {
#   key_name   = "aps1-2"
#   public_key = "AAAAB3NzaC1yc2EAAAADAQABAAABAQCVWWem+qGUJiUEWU+WHqgzs/LviWVOsWgmBojiiO96L6Lekq9SVasCubCRVAGWBvmjLAe7pi/i3ttdknKQIhM0jrE687TCVC861HmMw1L0wQGTDj1Ukfr1xS2nEhYVR8Kk/0ZSDKbK8a/KpdwQ8Zcf+SL+TKDNwv1ArpamDEk/wPJh9PGqXexCdRqtmcTRDhVGnpomfiVVqcPOBMjpAu2VLXEauBose20E8XsEpyNM3E55CnjxAvefV/JP6orrH34YtsFMdbz2uLTFLfWo7WqdcZnGfUG5AO8rxvs29kQ8aHpbk7VQUB4y1WKBYV/LYSWZbtkSeAdtcAyED8iW6zW9"
# }