resource "aws_db_subnet_group" "default" {
  name       = "${terraform.env}-db-subnet-group"
  subnet_ids = [
    "${aws_subnet.private_a.id}",
    "${aws_subnet.private_c.id}"
  ]

  tags {
    Name = "${terraform.env}-db-subnet-group"
    Environment = "${terraform.env}"
  }
}
