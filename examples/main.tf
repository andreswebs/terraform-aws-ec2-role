module "ec2_role" {
  source       = "github.com/andreswebs/terraform-aws-ec2-role"
  role_name    = "demo-ec2-instance"
  profile_name = "demo-ec2-instance"
  managed_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore",
    "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy",
    "arn:aws:iam::aws:policy/AmazonSSMDirectoryServiceAccess",
  ]
}
