output "userMessage" {	
  value = <<EOF
user name: ${aws_iam_user.newUser.name}	
password: ${aws_iam_user_login_profile.newUserLogin.encrypted_password}
other message: 'other message'	
EOF
}

output "password" {
  value = aws_iam_user_login_profile.newUserLogin.encrypted_password
}