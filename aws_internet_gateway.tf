resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.main.id}"

  tags {
    Name = "${terraform.env}-igw"
    Environment = "${terraform.env}"
  }
}
