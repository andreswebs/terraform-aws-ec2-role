/**
* Creates an IAM Role and an EC2 instance profile using the role, with a list of attached IAM policies.
*/

terraform {
  required_version = ">= 1.0.0"

  required_providers {

    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.46.0"
    }

  }
}

data "aws_iam_policy_document" "this" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "this" {
  name               = var.role_name
  assume_role_policy = data.aws_iam_policy_document.this.json
  tags               = var.tags
}

resource "aws_iam_instance_profile" "this" {
  name = var.profile_name
  role = aws_iam_role.this.name
}

resource "aws_iam_role_policy_attachment" "this" {
  for_each   = toset(var.policies)
  role       = aws_iam_role.this.name
  policy_arn = each.value
}
