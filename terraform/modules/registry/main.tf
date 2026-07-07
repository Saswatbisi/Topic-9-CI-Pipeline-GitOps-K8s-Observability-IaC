variable "registry_name" {
  type        = string
  description = "ECR Repository Name"
}

resource "aws_ecr_repository" "registry" {
  name                 = var.registry_name
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  encryption_configuration {
    encryption_type = "KMS"
  }

  tags = {
    Environment = "production"
  }
}

output "registry_url" {
  value = aws_ecr_repository.registry.repository_url
}
