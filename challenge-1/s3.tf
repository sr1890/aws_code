resource "aws_s3_bucket" "my_bucket" {
  bucket = "${var.my_app_s3_bucket}"
  acl    = "private"
  tags = {
    Name        = "javahome-app-de"
    Environment = "${terraform.workspace}"
  }
}

resource "aws_s3_bucket" "neohome-alb-access-logs" {
  bucket = "neohome-alb-access-logs"
  policy = "${data.template_file.neohome.rendered}"
  acl    = "private"
   tags = {
    Name        = "neohome-alb-access-logs"
    Environment = "${terraform.workspace}"
  }
}
