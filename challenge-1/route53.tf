# data "aws_route53_zone" "neohome" {
#   name         = "neohome123.tk."
#   private_zone = false
# }

# resource "aws_route53_record" "neohome" {
#   zone_id = "${data.aws_route53_zone.neohome.zone_id}"
#   name    = "${data.aws_route53_zone.neohome.name}"
#   type    = "A"

#   alias {
#     name                   = "${aws_elb.neohome_elb.dns_name}"
#     zone_id                = "${aws_elb.neohome_elb.zone_id}"
#     evaluate_target_health = false
#   }
# }
