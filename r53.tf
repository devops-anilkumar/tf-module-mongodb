# # THIS CREATES THE C NAME RECORD FOR MONGODB
# resource "aws_route53_record" "mongodb" {
#   zone_id = "Z01019823KGEEYKYEE9GQ"
#   name    = "www.example.com"
#   type    = "A"
#   ttl     = 300
#   records = [aws_eip.lb.public_ip]
# }