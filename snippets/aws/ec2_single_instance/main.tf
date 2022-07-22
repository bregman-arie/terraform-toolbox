terraform {
  required_providers {
    aws = {}
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

}

resource "aws_instance" "some_server" {
  ami           = "ami-07f493412d6213de6"
  instance_type = "t2.micro"

  tags = {
    Name = "SomeInstance"
  }
}
