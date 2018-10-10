resource "aws_security_group_rule" "elb_allow_80" {
  type            = "ingress"
  from_port       = 80
  to_port         = 80
  protocol        = "tcp"
  cidr_blocks     = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.elb-sg.id}"
}

resource "aws_security_group_rule" "web_allow_80_from_elb" {
  type            = "ingress"
  from_port       = 80
  to_port         = 80
  protocol        = "tcp"
  source_security_group_id = "${aws_security_group.elb-sg.id}"

  security_group_id = "${aws_security_group.web-sg.id}"
}

resource "aws_security_group_rule" "web_allow_22" {
  type            = "ingress"
  from_port       = 22
  to_port         = 22
  protocol        = "tcp"
  cidr_blocks     = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.web-sg.id}"
}

resource "aws_security_group_rule" "db_allow_3306_from_web" {
  type            = "ingress"
  from_port       = 3306
  to_port         = 3306
  protocol        = "tcp"
  source_security_group_id = "${aws_security_group.web-sg.id}"

  security_group_id = "${aws_security_group.db-sg.id}"
}
