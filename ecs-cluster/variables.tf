########################### Project name #############################
variable "APP_NAME" {}
variable "ENV_PREFIX" {}

########################### VPC Config ###############################
variable "AWS_REGION" {}
variable "VPC_ID" {}
variable "PUBLIC_SUBNETS_IDS" {}
variable "PRIVATE_SUBNETS_IDS" {}

########################### RDS Config ###############################
variable "RDS_ENDPOINT" {}
variable "DATABASE_USER" {}
variable "DATABASE_PASSWORD" {}
variable "DATABASE_NAME" {}

########################### ECS Service ###############################
variable "CONTAINER_NAME" {}
variable "CONTAINER_PORT" {}
variable "NB_REPLICAS" {}
variable "FARGATE_CPU" {}
variable "FARGATE_MEMORY" {}
variable "DOCKER_IMAGE_NAME" {}
variable "DOCKER_IMAGE_TAG" {}