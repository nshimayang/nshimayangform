output "elb-dns-name" {
  value = "${aws_elb.elb.dns_name}"
}

output "web-a-ip" {
  value = "${aws_instance.web-a.public_ip}"
}

output "web-c-ip" {
  value = "${aws_instance.web-c.public_ip}"
}

output "rds-endpoint" {
  value = "${aws_db_instance.default-db.endpoint}"
}
