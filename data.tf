# data "aws_db_instance" "database" {
#   db_instance_identifier = "rds-${var.projectName}"
# }

# data "aws_ecr_image" "sonar_image" {
#   repository_name = var.projectName
#   image_tag       = "latest"
# }