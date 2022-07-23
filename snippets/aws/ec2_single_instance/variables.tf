variable "region" {
  default = "eu-west-1"
}

variable "environment" {
  default = "staging"
}

variable "application" {
  default = "demo"
}

variable "owner" {
  default = "Terraform Toolbox"
}

variable "instance_count" {
  default = 1
}

variable "ec2_name" {
  default = "staging"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "keypair_pubkey" {}

variable "bootstrap_username" {
  default = "demo"
}

variable "associate_public_ip_address" {
  default = true
}