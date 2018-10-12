data "template_file" "user_data" {
  template = "${file("${path.module}/install_httpd.sh")}"
}

resource "aws_instance" "web-a" {
  ami           = "${data.aws_ami.amazon_linux.id}"
  instance_type = "t2.micro"
  user_data = "${data.template_file.user_data.rendered}"
  subnet_id = "${aws_subnet.public_a.id}"
  associate_public_ip_address = true
  key_name = "nshimayangform"
  # iam_instance_profile = 
  vpc_security_group_ids = ["${aws_security_group.web-sg.id}"]
  root_block_device {
      volume_type = "gp2"
      volume_size = "30"
      delete_on_termination = "true"
  }
  tags {
    Name = "${terraform.env}-web-az-a"
    Environment = "${terraform.env}"
  }
}

resource "aws_instance" "web-c" {
  ami           = "${data.aws_ami.amazon_linux.id}"
  instance_type = "t2.micro"
  user_data = "${data.template_file.user_data.rendered}"
  subnet_id = "${aws_subnet.public_c.id}"
  associate_public_ip_address = true
  key_name = "nshimayangform"
  # iam_instance_profile = 
  vpc_security_group_ids = ["${aws_security_group.web-sg.id}"]
  root_block_device {
      volume_type = "gp2"
      volume_size = "30"
      delete_on_termination = "true"
  }
  tags {
    Name = "${terraform.env}-web-az-c"
    Environment = "${terraform.env}"
  }
}
