resource "aws_security_group" "elb-sg" {
  name        = "elb-sg"
  description = "Allow 80 inbound traffic"
  vpc_id      = "${aws_vpc.main.id}"

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  tags {
    Name = "${terraform.env}-elb-sg"
    Environment = "${terraform.env}"
  }
}

resource "aws_security_group" "web-sg" {
  name        = "web-sg"
  description = "Allow 80 From elb-sg & 22 inbound traffic"
  vpc_id      = "${aws_vpc.main.id}"

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  tags {
    Name = "${terraform.env}-web-sg"
    Environment = "${terraform.env}"
  }
}
