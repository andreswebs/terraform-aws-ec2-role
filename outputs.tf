output "instance_profile" {
  value       = aws_iam_instance_profile.this
  description = "The instance profile resource"
}

output "role" {
  value       = aws_iam_role.this
  description = "The instance IAM role resource"
}
