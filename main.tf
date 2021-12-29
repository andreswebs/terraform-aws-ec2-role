/**
* Creates an IAM Role and an EC2 instance profile using the role, with a list of attached IAM policies.
*/

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
