locals {
  ingress_rules = [{
    port      = 443
    description = "this is port 443"

  },
  {
    port = 80
    description = "this is port 80"
  }]
}