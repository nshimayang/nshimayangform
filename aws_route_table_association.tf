resource "aws_route_table_association" "a" {
  subnet_id      = "${aws_subnet.public_a.id}"
  route_table_id = "${aws_route_table.r.id}"
}

resource "aws_route_table_association" "c" {
  subnet_id      = "${aws_subnet.public_c.id}"
  route_table_id = "${aws_route_table.r.id}"
}
