data "aws_caller_identity" "account" {}


module "ecs-wordpress" {
  source                     = "git::https://github.com/AbderrahmenISSA/terraform-modules.git//ecs-wordpress?ref=https-wordpress" 
  APP_NAME                   = var.APP_NAME
  ENV_PREFIX                 = var.ENV_PREFIX
  AWS_REGION                 = var.AWS_REGION
  VPC_ID                     = var.VPC_ID
  PUBLIC_SUBNETS_IDS         = var.PUBLIC_SUBNETS_IDS
  PRIVATE_APP_SUBNETS_IDS    = var.PRIVATE_APP_SUBNETS_IDS
  PRIVATE_DB_SUBNETS_IDS     = var.PRIVATE_DB_SUBNETS_IDS
  DATABASE_INSTANCE_CLASS    = var.DATABASE_INSTANCE_CLASS
  DATABASE_USER              = var.DATABASE_USER
  DATABASE_PASSWORD          = var.DATABASE_PASSWORD
  DATABASE_NAME              = var.DATABASE_NAME
  TASK_EXECUTION_ROLE_ARN    = var.TASK_EXECUTION_ROLE_ARN
  CONTAINER_NAME             = var.CONTAINER_NAME
  CONTAINER_PORT             = var.CONTAINER_PORT
  NB_REPLICAS                = var.NB_REPLICAS
  FARGATE_CPU                = var.FARGATE_CPU
  FARGATE_MEMORY             = var.FARGATE_MEMORY
  DOCKER_IMAGE_NAME          = var.DOCKER_IMAGE_NAME
  DOCKER_IMAGE_TAG           = var.DOCKER_IMAGE_TAG
  CERTIFICATE_ARN            = var.CERTIFICATE_ARN
  ZONE                       = var.ZONE
  RECORD                     = var.RECORD

}

output "output-alb-dns" {
  value           = module.ecs-wordpress.ALB_DNS_NAME
  description     = "ALB DNS"
}
