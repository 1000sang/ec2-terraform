output "load_balancer_arn" {
    value = aws_lb.this.arn
}

output "sg_id"{
    value = aws_security_group.this.id
}

output "dns_name"{
    value = aws_lb.this.dns_name
}

output "zone_id"{
    value = aws_lb.this.zone_id
}