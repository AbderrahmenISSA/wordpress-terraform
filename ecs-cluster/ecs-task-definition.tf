data "template_file" "TEMPLATE_FILE" {
  template = <<EOF
[
  {
      "name": "$${CONTAINER_NAME}",
      "image": "$${DOCKER_IMAGE_NAME}:$${DOCKER_IMAGE_TAG}",
      "environment": [
          {
              "name": "MARIADB_HOST",
              "value": "$${RDS_ENDPOINT}"
          },
          {   
              "name": "WORDPRESS_DATABASE_USER",
              "value": "$${DATABASE_USER}"
          },
          {   
              "name": "WORDPRESS_DATABASE_PASSWORD",
              "value": "$${DATABASE_PASSWORD}"
          },
          {   
              "name": "WORDPRESS_DATABASE_NAME",
              "value": "$${DATABASE_NAME}"
          },
          {   
              "name": "PHP_MEMORY_LIMIT",
              "value": "512M"
          },
          {   
              "name": "enabled",
              "value": "false"
          },
          {   
              "name": "ALLOW_EMPTY_PASSWORD",
              "value": "yes"
          }
       ],
      "portMappings": [
          {
              "containerPort": $${CONTAINER_PORT},
              "protocol": "tcp"
          }
        ],
      "essential": true,
      "mountPoints": [
          {
              "containerPath": "/bitnami/wordpress",
              "sourceVolume": "$${EFS_MOUNT_VOLUME}"
          }
      ]
    }
]
EOF

  vars = {
    CONTAINER_NAME     = "${var.CONTAINER_NAME}"
    DOCKER_IMAGE_NAME  = "${var.DOCKER_IMAGE_NAME}"
    DOCKER_IMAGE_TAG   = "${var.DOCKER_IMAGE_TAG}"
    CONTAINER_PORT     = var.CONTAINER_PORT
    RDS_ENDPOINT       = "${var.RDS_ENDPOINT}"
    DATABASE_USER      = "${var.DATABASE_USER}"
    DATABASE_PASSWORD  = "${var.DATABASE_PASSWORD}"
    DATABASE_NAME      = "${var.DATABASE_NAME}"
    EFS_MOUNT_VOLUME   = "${var.APP_NAME}-${var.ENV_PREFIX}-volume"
  }
}

resource "aws_ecs_task_definition" "ECS_TASK_DEFINITION" {
  family                   = "${var.APP_NAME}"
  container_definitions    = data.template_file.TEMPLATE_FILE.rendered
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.FARGATE_CPU
  memory                   = var.FARGATE_MEMORY

  volume {
    name = "${var.APP_NAME}-${var.ENV_PREFIX}-volume"
    efs_volume_configuration {
        file_system_id        = aws_efs_file_system.EFS.id
        transit_encryption    = "ENABLED"
        authorization_config {
              access_point_id = aws_efs_access_point.EFS_AP.id
              iam             = "DISABLED"
        }
      }
  }
}
