provider "aws" { }

resource "aws_iam_user" "bob" {
  name = "Bob"
}

resource "aws_iam_group" "admins" {
  name = "Admins"
  path = "/Groups/"
}

resource "aws_iam_group_policy_attachment" "adminaccess-attach" {
    group = aws_iam_group.admins.name
    policy_arn ="arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_user_group_membership" "bob-admins" {
    user = "Bob"
    groups = [
        aws_iam_group.admins.name
    ]
}