resource "aws_ecs_task_definition" "task" {
  family = "TSK-${var.projectName}"
  container_definitions = jsonencode([
    {
      name      = "${var.projectName}"
      essential = true,
      image     = "${aws_ecr_repository.repository.repository_url}:latest",
      command   = ["-Dsonar.search.javaAdditionalOpts=-Dnode.store.allow_mmap=false"]
      environment = [
        {
          name  = "SONAR_JDBC_URL"
          value = "jdbc:postgresql://${data.aws_db_instance.database.endpoint}/${aws_db_instance.rds.db_name}"
        },
        {
          name  = "SONAR_JDBC_USERNAME"
          value = "${var.rdsUser}"
        },
        {
          name  = "SONAR_JDBC_PASSWORD"
          value = "${var.rdsPass}"
        }
      ]
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          awslogs-group         = "${aws_cloudwatch_log_group.cloudwatch-log-group.name}"
          awslogs-region        = "${var.regionDefault}"
          awslogs-stream-prefix = "ecs"
        }
      }
      portMappings = [
        {
          containerPort = 9000
          hostPort      = 9000
          protocol      = "tcp"
        }
      ]
    }
  ])
  network_mode = "awsvpc"

  requires_compatibilities = ["FARGATE"]

  execution_role_arn = "arn:aws:iam::${var.AWSAccount}:role/ecsTaskExecutionRole"

  memory = "4096"
  cpu    = "2048"

  depends_on = [aws_db_instance.rds]
}