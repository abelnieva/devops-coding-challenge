data "template_file" "init" {
  template = "${file("${path.module}/script/init.tpl")}"
}

resource "aws_launch_configuration" "example-launchconfig" {
  name_prefix     = "service-launchconfig"
  image_id        = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type   = "t2.micro"
  key_name        = "${aws_key_pair.mykeypair.key_name}"
  security_groups = ["${aws_security_group.service_instance.id}"]
  user_data       = "${data.template_file.init.rendered}"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "example-autoscaling" {
  name                      = "service-autoscaling"
  vpc_zone_identifier       = ["${aws_subnet.main-public-1.id}", "${aws_subnet.main-public-2.id}"]
  launch_configuration      = "${aws_launch_configuration.example-launchconfig.name}"
  min_size                  = "${var.service_min_size}"
  max_size                  = "${var.service_max_size}"
  health_check_grace_period = 300
  health_check_type         = "ELB"
  load_balancers            = ["${aws_elb.main-elb.name}"]
  force_delete              = true

  tag {
    key                 = "Name"
    value               = "ec2 instance"
    propagate_at_launch = true
  }
}
