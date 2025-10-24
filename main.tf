data "aws_partition" "current" {}

locals {
  partition  = data.aws_partition.current.partition
  dns_suffix = data.aws_partition.current.dns_suffix

  managed_policy_arn_prefix    = "arn:${local.partition}:iam::aws:policy"
  default_managed_policy_arns  = [for n in var.default_managed_policy_names : "${local.managed_policy_arn_prefix}/${n}"]
  container_service_policy     = ["${local.managed_policy_arn_prefix}/service-role/AmazonEC2ContainerServiceforEC2Role"]
  instance_managed_policy_arns = var.attach_container_service_policy ? setunion(local.default_managed_policy_arns, local.container_service_policy, var.managed_policy_arns) : setunion(local.default_managed_policy_arns, var.managed_policy_arns)
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
  name                  = var.role_name
  description           = var.role_description
  force_detach_policies = true
  assume_role_policy    = data.aws_iam_policy_document.this.json
  tags                  = var.tags
}

resource "aws_iam_instance_profile" "this" {
  name = var.profile_name
  role = aws_iam_role.this.name
  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "this" {
  for_each   = local.instance_managed_policy_arns
  role       = aws_iam_role.this.name
  policy_arn = each.value
}
