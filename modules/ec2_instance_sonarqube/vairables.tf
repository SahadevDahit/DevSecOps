variable "key_name" {
  description = "The name of the EC2 key pair"
  default     = "secret-door"
}

variable "security_group_name" {
  description = "The name of the security group to attach to the EC2 instance"
  default     = "JenkinsSecurityGroup"
}

variable "storage_size_gb" {
  description = "The size of the root volume in GB"
  default     = 20
}
