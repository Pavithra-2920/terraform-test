provider "aws" {
    region = "ap-south-1"
  
}

resource "aws_iam_user" "IAM-aps1-users" {
  count = length(var.user_names)
  name  = var.user_names[count.index]
}

variable "user_names" {
  description = "IAM usernames"
  type        = list(string)
  default     = ["user1", "user2", "user3"]
} 

output "print_the_names" {
  value = [for name in var.user_names: name]
}

