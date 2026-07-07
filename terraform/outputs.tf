output "eks_cluster_endpoint" {
  description = "EKS Cluster Control Plane API Endpoint"
  value       = module.eks.endpoint
}

output "eks_cluster_name" {
  description = "EKS Cluster Name"
  value       = module.eks.cluster_name
}

output "registry_url" {
  description = "ECR Repository URL"
  value       = module.registry.registry_url
}
