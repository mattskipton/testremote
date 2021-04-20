provider "aws" {
  region = "us-east-1"
}


resource "aws_iam_user" "newUser" {
 name = "atcUser"
 path = "/system/"

 tags = {
  tag-key = "test-user"
 }
}

resource "aws_iam_user_login_profile" "newUserLogin" {
 user    = aws_iam_user.newUser.name
 pgp_key = "keybase:test"
}

resource "aws_iam_user_policy" "lb_ro" {
 name = "test"
 user = aws_iam_user.newUser.name
 policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:Describe*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}
