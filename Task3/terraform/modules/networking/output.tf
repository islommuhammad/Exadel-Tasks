output "vpc" {
  value = module.vpc
}
output "sg_pub_id" {
  value = aws_security_group.allow_pub.id
}
output "sg_priv_id" {
  value = aws_security_group.allow_priv.id
}