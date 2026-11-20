# Infrastructure - managed by engineering team
# NOTE: Module versions are pinned - Jig will enforce upgrades
terraform {
  required_version = ">= 1.5.0"
}

# VPC Module - outdated version (5.0.0), Jig will update to 5.1.0
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.2.0"
  name    = "demo-vpc"
  cidr    = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = false

  tags = {
    Terraform   = "true"
    Environment = "production"
  }
}

# RDS Module - outdated version (6.1.1), Jig will update to 6.3.0
module "db" {
  source     = "terraform-aws-modules/rds/aws"
  version    = "6.3.0"
  identifier = "demo-db"

  engine            = "mysql"
  engine_version    = "8.0.32"
  instance_class    = "db.t3.large"
  allocated_storage = 20

  db_name  = "appdb"
  username = "admin"
  port     = "3306"

  vpc_security_group_ids = ["sg-12345678"]
  subnet_ids             = ["subnet-12345678", "subnet-87654321"]

  family               = "mysql8.0"
  major_engine_version = "8.0"

  deletion_protection = true
}

# S3 Module - also outdated
module "s3_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "4.0.0"
  bucket  = "demo-app-artifacts"
  acl     = "private"

  versioning = {
    enabled = true
  }
}
