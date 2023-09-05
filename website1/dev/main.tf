data "aws_caller_identity" "account" {}

module "rds-wordpress" {
  source                   = "git::https://github.com/AbderrahmenISSA/terraform-modules.git//rds-mysql?ref=1.0"
  APP_NAME                   = var.APP_NAME
  ENV_PREFIX                 = var.ENV_PREFIX
  VPC_ID                     = var.VPC_ID
  SUBNETS_IDS                = var.PRIVATE_SUBNETS_IDS
  DATABASE_USER              = var.DATABASE_USER
  DATABASE_PASSWORD          = var.DATABASE_PASSWORD
  DATABASE_NAME              = var.DATABASE_NAME
  DATABASE_INSTANCE_CLASS    = var.DATABASE_INSTANCE_CLASS
  AUTHORISED_CIDR_BLOCKS     = var.AUTHORISED_CIDR_BLOCKS
}

module "ecs-wordpress" {
  source                     = "git::https://github.com/AbderrahmenISSA/terraform-modules.git//ecs-cluster?ref=1.0" 
  APP_NAME                   = var.APP_NAME
  ENV_PREFIX                 = var.ENV_PREFIX
  AWS_REGION                 = var.AWS_REGION
  VPC_ID                     = var.VPC_ID
  PUBLIC_SUBNETS_IDS         = var.PUBLIC_SUBNETS_IDS
  PRIVATE_SUBNETS_IDS        = var.PRIVATE_SUBNETS_IDS
  RDS_ENDPOINT               = "${element(split(":", module.rds-wordpress.RDS_Database_Endpoint), 0)}"
  DATABASE_USER              = var.DATABASE_USER
  DATABASE_PASSWORD          = var.DATABASE_PASSWORD
  DATABASE_NAME              = var.DATABASE_NAME
  CONTAINER_NAME             = var.CONTAINER_NAME
  CONTAINER_PORT             = var.CONTAINER_PORT
  NB_REPLICAS                = var.NB_REPLICAS
  FARGATE_CPU                = var.FARGATE_CPU
  FARGATE_MEMORY             = var.FARGATE_MEMORY
  DOCKER_IMAGE_NAME          = var.DOCKER_IMAGE_NAME
  DOCKER_IMAGE_TAG           = var.DOCKER_IMAGE_TAG

  depends_on                = [module.rds-wordpress]
}

output "output-rds-endpoint" {
  value           = module.rds-wordpress.RDS_Database_Endpoint
  description     = "RDS Endpoint"
}

output "output-alb-dns" {
  value           = module.ecs-wordpress.ALB_DNS_NAME
  description     = "ALB DNS"
}
