variable "testing_environment" {
  description = "testing name and environment"
  type = map(string) 
  default = {
    "Name" = "Default-instance",
    "environment" ="testing"
  }
}
