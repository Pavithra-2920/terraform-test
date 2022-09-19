locals{
    join_list = join(", ", ["foo", "bar", "baz"]) 
    max_list = max(12, 54, 3)
    min_list= min(12, 54, 3)
    lower_str= lower("HELLO")
    upper_str= upper("data")
    split_str=split(",", "foo,bar,baz")
    trim_str=trim("foobar", "far")
}
output "outcome_1" {
    value = local.join_list
}
output "outcome_2" {
    value = local.max_list
}
output "outcome_3" {
    value = local.min_list
}
output "outcome_4" {
    value = local.max_list
}
output "outcome_5" {
    value = local. lower_str
}
output "outcome_6" {
    value = local.upper_str
}
output "outcome_7" {
    value = local.split_str
}
output "outcome_8" {
    value = local.trim_str
}


###########################RANGE#####################################
variable "name_counts" {
  type    = map(number)
  default = {
    "foo" = 2
    "bar" = 4
  }
}

locals {
  expanded_names = {
    for name, count in var.name_counts : name => [
      for i in range(count) : format("%s%02d", name, i)
    ]
  }
}

output "expanded_names" {
  value = local.expanded_names
}
#####################SORT##########################
locals {
 Name = sort(["production", "testing", "application", "design"]) 
}
output "sorted_names" {
  value = local.Name

}
#########################Base64 decode /encode#############################
locals {
  data1 = base64decode("SGVsbG8gV29ybGQ=")
  
}
output "data1" {
    value = local.data1
  
} 
################################ENCODE##########################################
locals {
  data1 = base64encode("apple")
  
}
output "data1" {
    value = local.data1
  
} 
######################################JSON decode and encode######################################
locals {
details = jsonencode(
    {"project"="jupiter",
      "envi" = "dev"
    }
)
}
output "new_project" {
    value = local.details
}

locals {
  welcome_message = jsondecode("{\"hello\": \"world\"}")
}
output "introduction" {
    value = local.welcome_message
}




 



 