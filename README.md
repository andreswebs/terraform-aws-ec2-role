# terraform-aws-ec2-role

Creates an IAM Role and an EC2 instance profile using the role, with a list of
attached IAM policies.

[//]: # (BEGIN_TF_DOCS)
Creates an IAM Role and an EC2 instance profile using the role, with a list of attached IAM policies.

## Usage

Example:

```hcl
module "ec2_role" {
  source       = "github.com/andreswebs/terraform-aws-ec2-role"
  role_name    = "demo-ec2-instance"
  profile_name = "demo-ec2-instance"
  policies = [
    "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore",
    "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy",
  ]
}
```



## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_policies"></a> [policies](#input\_policies) | List of policy ARNs to attach to the IAM role | `list(string)` | `[]` | no |
| <a name="input_profile_name"></a> [profile\_name](#input\_profile\_name) | Profile name; auto-generated if unset | `string` | `null` | no |
| <a name="input_role_name"></a> [role\_name](#input\_role\_name) | Role name; auto-generated if unset | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to the IAM role | `map(string)` | `{}` | no |

## Modules

No modules.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_instance_profile"></a> [instance\_profile](#output\_instance\_profile) | The instance profile resource |
| <a name="output_role"></a> [role](#output\_role) | The instance IAM role resource |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.0 |

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Resources

| Name | Type |
|------|------|
| [aws_iam_instance_profile.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_policy_document.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

[//]: # (END_TF_DOCS)

## Authors

**Andre Silva** - [@andreswebs](https://github.com/andreswebs)

## License

This project is licensed under the [Unlicense](UNLICENSE.md).
