resource "aws_ecs_cluster" "cluster" {
  name = var.clusterName
  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}

