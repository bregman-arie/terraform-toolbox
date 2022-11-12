# =================== EC2 ===============================

resource "aws_instance" "demo-bastion-1" {
  ami = data.aws_ami.amazon-linux.image_id
  instance_type = "t2.micro"
  associate_public_ip_address = true
  subnet_id = var.subnet2_102_id
  vpc_security_group_ids = [aws_security_group.demo-sg-2.id]
  key_name = "some-key"

  tags = {
    Purpose: Demo
    Name: "demo-bastion-1"
  }
}

# =================== ALB ===============================
resource "aws_lb" "demo-alb" {
  name                       = "demo-alb"
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = [aws_security_group.prod-sg-1.id]
  enable_deletion_protection = false
  subnets                    = [
    var.demo_subnet1_id,
    var.demo_subnet2_id,
  ]

  tags = {
    Purpose: "Demo"
    Name: "Demo-alb"
  }
}

resource "aws_lb_target_group" "demo-alb-target-group" {
  port     = 80
  protocol = "HTTP"
  vpc_id = var.vpc_id
}

resource "aws_lb_target_group_attachment" "demo-alb-target-1" {
  target_group_arn = aws_lb_target_group.demo-alb-target-group.arn
  target_id        = aws_instance.demo-ec2-worker-1.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "cpu-205-alb-target-2" {
  target_group_arn = aws_lb_target_group.demo-alb-target-group.arn
  target_id        = aws_instance.demo-ec2-worker-2.id
  port             = 80
}
resource "aws_lb_target_group_attachment" "cpu-205-alb-target-3" {
  target_group_arn = aws_lb_target_group.demo-alb-target-group.arn
  target_id        = aws_instance.demo-ec2-worker-3.id
  port             = 80
}

resource "aws_lb_listener" "demo_alb_listener" {
  load_balancer_arn = aws_lb.demo-alb.arn
  port = 80
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.demo-alb-target-group.arn
  }
}
