variable "aws_region" {
  type        = string
  description = "AWS region for provisioning resources"
  default     = "us-east-1"
}

variable "cluster_name" {
  type        = string
  description = "Name of the EKS cluster"
  default     = "orion-lms-cluster"
}

variable "registry_name" {
  type        = string
  description = "Name of the ECR registry repository"
  default     = "orion-lms-app"
}
