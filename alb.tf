resource "aws_lb" "alb" {
  name               = "ALB-${var.projectName}"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["${aws_security_group.sg.id}"]
  subnets            = ["${var.subnet01}", "${var.subnet02}", "${var.subnet03}"]
  idle_timeout       = 60

}

resource "aws_lb_listener" "alb-listener-redirect" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "9000"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}