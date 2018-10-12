resource "aws_db_parameter_group" "default" {
  name   = "${terraform.env}-parameter-g"
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
    Name = "${terraform.env}-parameter-g"
    Environment = "${terraform.env}"
  }
}
