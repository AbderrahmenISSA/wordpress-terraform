######################### AWS Configuration ############################
variable "AWS_ACCESS_KEY_ID" {}
variable "AWS_SECRET_ACCESS_KEY" {}
variable "AWS_REGION" {
    default = "eu-west-1"
}

########################### VPC Config ###############################
variable "VPC_ID" {}
variable "PUBLIC_SUBNETS_IDS" {
    type    = list(any)
    default = []
}
variable "PRIVATE_APP_SUBNETS_IDS" {
    type    = list(any)
    default = []
}
variable "PRIVATE_DB_SUBNETS_IDS" {
    type    = list(any)
    default = []
}

########################### Project name #############################
variable "APP_NAME" {}
variable "ENV_PREFIX" {}

########################### RDS Config ###############################
variable "DATABASE_USER" {}
variable "DATABASE_PASSWORD" {}
variable "DATABASE_NAME" {}
variable "DATABASE_INSTANCE_CLASS" {}
variable "AUTHORISED_CIDR_BLOCKS" {
    type    = list(any)
    default = []
}

########################### ECS Service ###############################
variable "TASK_EXECUTION_ROLE_ARN" {}
variable "CONTAINER_NAME" {}
variable "CONTAINER_PORT" {}
variable "NB_REPLICAS" {}
variable "FARGATE_CPU" {}
variable "FARGATE_MEMORY" {}
variable "CERTIFICATE_ARN" {}
variable "DOCKER_IMAGE_NAME" {}
variable "DOCKER_IMAGE_TAG" {}

##################### ROUTE 53 CONFIGURATION #########################
variable "ZONE" {}
variable "RECORD" {}