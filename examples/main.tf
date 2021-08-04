module "ec2_role" {
  source       = "github.com/andreswebs/terraform-aws-ec2-role"
  role_name    = "demo-ec2-instance"
  profile_name = "demo-ec2-instance"
  policies = [
    "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore",
    "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy",
  ]
}