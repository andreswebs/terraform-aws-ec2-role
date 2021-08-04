variable "role_name" {
  type = string
  default     = null
  description = "Role name; auto-generated if unset"
}

variable "profile_name" {
  type = string
  default     = null
  description = "Profile name; auto-generated if unset"
}

variable "policies" {
  type        = list(string)
  default     = []
  description = "List of policy ARNs to attach to the IAM role"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags to apply to the IAM role"
}
