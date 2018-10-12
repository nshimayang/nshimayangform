resource "aws_db_option_group" "default" {
  name                     = "${terraform.env}-option-g"
  option_group_description = "Terraform Option Group"
  engine_name              = "mysql"
  major_engine_version     = "5.7"

  tags {
    Name = "${terraform.env}-option-g"
    Environment = "${terraform.env}"
  }
}
