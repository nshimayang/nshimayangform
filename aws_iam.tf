resource "aws_iam_role" "web-role" {
  name = "${terraform.env}-web-role"
  path = "/system/"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
               "Service": "ec2.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF
}

resource "aws_iam_instance_profile" "web-role-profile" {
  name = "${terraform.env}-web-role-profile"
  role = "${aws_iam_role.web-role.name}"
}

