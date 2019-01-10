resource "aws_elb" "main-elb" {
  name            = "${var.sufix_challenge}-elb"
  subnets         = ["${aws_subnet.main-public-1.id}", "${aws_subnet.main-public-2.id}"]
  security_groups = ["${aws_security_group.elb-securitygroup.id}"]

  listener {
    instance_port     = "${var.ec2_port}"
    instance_protocol = "http"
    lb_port           = "${var.ELB_port}"
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 4
    timeout             = 3
    target              = "HTTP:${var.ec2_port}/${var.healthcheckpath}"
    interval            = 30
  }

  cross_zone_load_balancing   = true
  connection_draining         = true
  connection_draining_timeout = 400

  tags {
    Name = "service-elb"
  }
}
