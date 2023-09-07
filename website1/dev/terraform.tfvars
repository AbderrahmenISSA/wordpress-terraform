VPC_ID                     = "vpc-053ccf57140630702"
PUBLIC_SUBNETS_IDS         = ["subnet-053882bf8acaca60a", "subnet-04f8731228a8a85e5"]
PRIVATE_APP_SUBNETS_IDS    = ["subnet-0140988c284e0d8a5", "subnet-055d390cb19608af0"]
PRIVATE_DB_SUBNETS_IDS     = ["subnet-034161f2c21e4c9e7", "subnet-0af1155e4f4aadbb1"]
DATABASE_USER              = "admin"
DATABASE_PASSWORD          = "supersecretpassword"
DATABASE_NAME              = "wordpress"
DATABASE_INSTANCE_CLASS    = "db.t3.micro"
AUTHORISED_CIDR_BLOCKS     = ["10.195.222.0/24"]
APP_NAME                   = "wordpress"
ENV_PREFIX                 = "dev"
TASK_EXECUTION_ROLE_ARN    = "arn:aws:iam::796814017752:role/ecsTaskExecutionRole"
CONTAINER_NAME             = "wordpress"
CONTAINER_PORT             = "8080"
NB_REPLICAS                = 2
FARGATE_CPU                = 1024
FARGATE_MEMORY             = 3072
DOCKER_IMAGE_NAME          = "796814017752.dkr.ecr.eu-west-1.amazonaws.com/wordpress"
DOCKER_IMAGE_TAG           = "1.0"
CERTIFICATE_ARN            = "arn:aws:acm:eu-west-1:796814017752:certificate/cc28b097-f47c-4e96-bc31-cc37f148c589"
ZONE                       = "noprod.myfrren.com"
RECORD                     = "wordpress.noprod.myfrren.com"