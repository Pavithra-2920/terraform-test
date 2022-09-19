output "vpc_ip_addr" {
  value =aws_vpc.prod.id
}

output "sg_id" {
    value = aws_security_group.aws_sg
}