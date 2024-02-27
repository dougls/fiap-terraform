resource "aws_ecs_service" "service" {
  name            = "SVC-${var.projectName}"
  cluster         = aws_ecs_cluster.cluster.arn
  task_definition = aws_ecs_task_definition.task.arn

  desired_count                      = 1
  deployment_minimum_healthy_percent = 100
  deployment_maximum_percent         = 200

  network_configuration {
    subnets          = ["${var.subnet01}", "${var.subnet02}", "${var.subnet03}"]
    security_groups  = ["${aws_security_group.sg.id}"]
    assign_public_ip = true
  }

  health_check_grace_period_seconds = 240

  load_balancer {
    target_group_arn = aws_lb_target_group.tg.arn
    container_name   = var.projectName
    container_port   = 9000
  }

  capacity_provider_strategy {
    base              = 1
    capacity_provider = "FARGATE"
    weight            = 1
  }

  deployment_circuit_breaker {
    enable   = true
    rollback = true
  }

  deployment_controller {
    type = "ECS"
  }

  depends_on = [aws_lb.alb]
}