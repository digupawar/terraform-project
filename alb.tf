resource "aws_lb" "dsp-alb" {
 name               = "dsp-alb"
 internal           = false
 load_balancer_type = "application"
 security_groups    = [aws_security_group.dsp-sg.id]
 subnets            = [aws_subnet.dsp-sub1.id, aws_subnet.dsp-sub2.id]

 tags = {
   Environment = "dev"
 }
}

// Listener
resource "aws_lb_listener" "dsp_alb_listener" {
 load_balancer_arn = aws_lb.dsp-alb.arn
 port              = "80"
 protocol          = "HTTP"

 default_action {
   type             = "forward"
   target_group_arn = aws_lb_target_group.dsp-tg.arn
 }
}

// Target groups
resource "aws_lb_target_group" "dsp-tg" { // Target Group
 name     = "dsp-tg"
 port     = 80
 protocol = "HTTP"
 vpc_id   = aws_vpc.dsp-vpc.id
}

// Target group attachment
resource "aws_lb_target_group_attachment" "dsp-tg-attachment1" {
 target_group_arn = aws_lb_target_group.dsp-tg.arn
 target_id        = aws_instance.dsp-ec2-1.id
 port             = 80
}

resource "aws_lb_target_group_attachment" "dsp-tg-attachment2" {
 target_group_arn = aws_lb_target_group.dsp-tg.arn
 target_id        = aws_instance.dsp-ec2-2.id
 port             = 80
}


