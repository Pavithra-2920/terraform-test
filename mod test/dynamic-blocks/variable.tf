variable "web_ingress" {
    type = map(object({
        port = number
        protocol = string
        cidr_blocks = list(string)
    }))

    default = {
      "80" = {
        cidr_blocks = [ "0.0.0.0/0" ]
        port = 80
        protocol = "tcp"
      }
     "443" = {
        cidr_blocks = [ "0.0.0.0/0" ]
        port = 443
        protocol = "tcp"
      }
    }
}