resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "main"
  }
}

output "vpc-id" {
  value = aws_vpc.main.id
}
