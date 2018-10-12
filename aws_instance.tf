data "template_file" "user_data" {
  template = "${file("${path.module}/install_httpd.sh")}"
}

resource "aws_instance" "web-a" {
  ami           = "ami-06cd52961ce9f0d85"
  instance_type = "t2.micro"
  user_data = "${data.template_file.user_data.rendered}"
  subnet_id = "${aws_subnet.public_a.id}"
  associate_public_ip_address = true
  key_name = "nshimayangform"
  # iam_instance_profile = 
  security_groups = ["${aws_security_group.web-sg.id}"]
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
