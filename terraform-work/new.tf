provider "aws" {
 alias  = "new_region"
 region = "us-east-2"


moved {
  from = aws_instance.myec2
  to   = aws_instance.myec2
}
}
