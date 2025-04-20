data "aws_partition" "current" {}

locals {
  dns_suffix = data.aws_partition.current.dns_suffix
}

data "aws_iam_policy_document" "this" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.${local.dns_suffix}"]
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
  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "this" {
  for_each   = toset(var.managed_policy_arns)
  role       = aws_iam_role.this.name
  policy_arn = each.value
}
