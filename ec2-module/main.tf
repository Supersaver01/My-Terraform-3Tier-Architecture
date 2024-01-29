# Security group
resource "aws_security_group" "demo_sg_group" {
  name        = var.security_group
  description = "allow ssh on 22 & http on port 80"
  vpc_id      = var.vpc_id

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}

#Instance Creation
resource "aws_instance" "aws_amazonlinux" {
  instance_type          = var.instance_type
  count                  = var.instance_count
  ami                    = data.aws_ami.amazon-2.id
  subnet_id              = var.subnet_id #Must specify
  vpc_security_group_ids = ["${aws_security_group.demo_sg_group.id}"]

    tags = {
    Name = "${var.instance_name}-${count.index}"
    Environment = var.environment
  }

}