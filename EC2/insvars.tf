variable "ami" {
    type = string
    description = "This is the operating system"
    default = "ami-0a3c3a20c09d6f377"
}
variable "chassis" {
    type = string
    default = "t2.micro"
}
variable "keyname" {
    type = string
    default = "system_key2"
}
variable "az" {
    type = string
    default = "us-east-1a"
}

variable "subnet_ids" {}
variable "L2sg_ssh_http" {}