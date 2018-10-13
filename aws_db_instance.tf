resource "aws_db_instance" "default-db" {
  identifier           = "${terraform.env}-db"
  allocated_storage    = 10
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7.23"
  instance_class       = "db.t2.micro"
  name                 = "nshimayangformdb"
  username             = "${var.dbuser}"
  password             = "${var.dbpassword}"
  parameter_group_name = "${aws_db_parameter_group.default.id}"
  option_group_name    = "${aws_db_option_group.default.id}"

  skip_final_snapshot  = true

  multi_az             = true
  publicly_accessible  = false
  db_subnet_group_name = "${aws_db_subnet_group.default.id}"
  vpc_security_group_ids = [
      "${aws_security_group.db-sg.id}"
  ]
  backup_retention_period = 3
  backup_window           = "17:00-17:30"
  maintenance_window      = "Mon:00:00-Mon:00:30"

  tags {
    Name = "${terraform.env}-db"
    Environment = "${terraform.env}"
  }
}
