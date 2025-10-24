variable "role_name" {
  type        = string
  description = "Role name; auto-generated if unset"
  default     = null
}

variable "role_description" {
  type        = string
  description = "Role description"
  default     = null
}

variable "profile_name" {
  type        = string
  description = "Profile name; auto-generated if unset"
  default     = null
}

variable "managed_policy_arns" {
  type        = list(string)
  description = "List of policy ARNs to attach to the IAM role"
  default     = []
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to all created resources"
  default     = {}
}

variable "default_managed_policy_names" {
  type        = list(string)
  description = "List of names of managed policies to attach the instance role"

  default = [
    "AmazonSSMManagedInstanceCore",
    "CloudWatchAgentServerPolicy",
  ]
}

variable "attach_container_service_policy" {
  type        = bool
  description = "Whether to attach the `AmazonEC2ContainerServiceforEC2Role` policy"
  default     = false
}
