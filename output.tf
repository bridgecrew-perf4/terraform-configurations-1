output "jenkins_instance_ip_addr" {
  value = aws_instance.jenkins_instance.public_ip
}

output "prod_load_balancer" {
  value = aws_lb.prod_load_balancer.dns_name
}
