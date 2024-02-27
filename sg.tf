resource "aws_security_group" "sg" {
  name        = "SG-${var.projectName}"
  description = var.projectName
  vpc_id      = var.vpcId

  ingress {
    description = "Sonar"
    from_port   = 9000
    to_port     = 9000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "All"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "sg-rds" {
  name        = "SG-${var.projectName}-rds"
  description = var.projectName
  vpc_id      = var.vpcId

  ingress {
    description = "VPC"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["${var.vpcCIDR}"]
  }

  egress {
    description = "VPC"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["${var.vpcCIDR}"]
  }
}