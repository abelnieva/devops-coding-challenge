resource "aws_security_group" "service_instance" {
  vpc_id      = "${aws_vpc.main.id}"
  description = "security group for my instance"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port       = "${var.ec2_port}"
    to_port         = "${var.ec2_port}"
    protocol        = "tcp"
    security_groups = ["${aws_security_group.elb-securitygroup.id}"]
  }

  tags {
    Name = "${var.sufix_challenge}-service"
  }
}

resource "aws_security_group" "elb-securitygroup" {
  vpc_id      = "${aws_vpc.main.id}"
  name        = "elb"
  description = "security group for load balancer"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = "${var.ELB_port}"
    to_port     = "${var.ELB_port}"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "elb"
  }
}
