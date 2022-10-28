variable "instance_type"{
    description = "Instance type t2.micro"
    type = string
    default = "t2.micro"
}

variable "key_name" {
    description = "key name for linux server"
    default = "demo-aps1"


}