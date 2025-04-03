provider "aws" {
  region = "ap-southeast-2"
}

resource "aws_iam_user" "awscliuser" {
  name = "awscliuser"
}

resource "aws_iam_user_policy_attachment" "admin_policy_attachment" {
  user       = aws_iam_user.awscliuser.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_access_key" "awscliuser_access_key" {
  user = aws_iam_user.awscliuser.name
}

resource "aws_iam_role" "s3_role" {
  name = "ec2-s3-access"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ec2_s3_access_policy_attachment" {
  role       = aws_iam_role.s3_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

output "awscliuser_access_key_id" {
  value = aws_iam_access_key.awscliuser_access_key.id
}

output "awscliuser_secret_access_key" {
  value = aws_iam_access_key.awscliuser_access_key.secret
  sensitive = true
}
