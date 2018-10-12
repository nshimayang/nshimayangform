resource "aws_db_parameter_group" "default" {
  name   = "${terraform.env}-pg"
  family = "mysql5.7"

  parameter {
    name  = "slow_query_log"
    value = "1"
  }

  parameter {
    name  = "long_query_time"
    value = "3"
  }

  tags {
    Name = "${terraform.env}-pg"
    Environment = "${terraform.env}"
  }
}
