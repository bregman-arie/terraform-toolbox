module "ec2" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 2.21.0"

  instance_count = var.instance_count

  name                        = var.ec2_name
  ami                         = var.linux_ami
  instance_type               = var.instance_type
  subnet_id                   = tolist(var.public_subnets)[random_integer.subnet.result]
  vpc_security_group_ids      = var.additional_security_groups
  associate_public_ip_address = var.associate_public_ip_address

  key_name = aws_key_pair.keypair.key_name

  enable_volume_tags = true

  tags = {
    Environment = var.environment
    Application = var.application
    Owner       = var.owner
  }

  root_block_device = [{
    volume_type = "gp3"
    volume_size = var.root_volume_size
  }]
}