terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket         = "topic-9-terraform-state-bucket"
    key            = "eks/state.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-lock-table"
  }
}

provider "aws" {
  region = var.aws_region
}

module "eks" {
  source       = "./modules/eks"
  cluster_name = var.cluster_name
  aws_region   = var.aws_region
}

module "registry" {
  source        = "./modules/registry"
  registry_name = var.registry_name
}
