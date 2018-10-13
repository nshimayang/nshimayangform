resource "aws_elb" "elb" {
  name               = "${terraform.env}-elb"
  instances                   = [
      "${aws_instance.web-a.id}",
      "${aws_instance.web-c.id}"
  ]
  subnets = [
      "${aws_subnet.public_a.id}",
      "${aws_subnet.public_c.id}"
  ]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 30
    target              = "HTTP:80/index.html"
  }

  security_groups = [
      "${aws_security_group.elb-sg.id}"
  ]
  cross_zone_load_balancing   = true
  idle_timeout                = 300
  connection_draining         = true
  connection_draining_timeout = 300

  depends_on = [
      "aws_instance.web-a",
      "aws_instance.web-c"
  ]

  tags {
    Name = "${terraform.env}-elb"
    Environment = "${terraform.env}"
  }
}
