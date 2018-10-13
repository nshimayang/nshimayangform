variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "region" {  default = "ap-northeast-1"}
variable "vpc_cidr" {  default = "10.0.0.0/16"}
variable "public_a"  {}
variable "public_c"  {}
variable "private_a" {}
variable "private_c" {}
variable "dbuser"     {}
variable "dbpassword" {}
variable "ssh_key_name" {  default = "nshimayangform"}
