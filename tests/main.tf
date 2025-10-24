module "ec2_role" {
  source           = "../"
  role_name        = var.role_name
  role_description = "Integration test from Terraform"
  profile_name     = var.profile_name

  attach_container_service_policy = true

  tags = {
    test = "ok"
  }
}
