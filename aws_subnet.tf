locals {
  public_a_cidr  = "10.0.${var.public_a}.0/24"
  public_c_cidr  = "10.0.${var.public_c}.0/24"
  private_a_cidr = "10.0.${var.private_a}.0/24"
  private_c_cidr = "10.0.${var.private_c}.0/24"
}

resource "aws_subnet" "public_a" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${local.public_a_cidr}"
  availability_zone = "ap-northeast-1a"
  map_public_ip_on_launch = true

  tags {
    Name = "${terraform.env}-public-subnet-a"
    Environment = "${terraform.env}"
  }
}

resource "aws_subnet" "public_c" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${local.public_c_cidr}"
  availability_zone = "ap-northeast-1c"
  map_public_ip_on_launch = true

  tags {
    Name = "${terraform.env}-public-subnet-c"
    Environment = "${terraform.env}"
  }
}

resource "aws_subnet" "private_a" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${local.private_a_cidr}"
  availability_zone = "ap-northeast-1a"

  tags {
    Name = "${terraform.env}-private-subnet-a"
    Environment = "${terraform.env}"
  }
}

resource "aws_subnet" "private_c" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${local.private_c_cidr}"
  availability_zone = "ap-northeast-1c"

  tags {
    Name = "${terraform.env}-private-subnet-c"
    Environment = "${terraform.env}"
  }
}
