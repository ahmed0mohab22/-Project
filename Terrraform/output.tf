    output "ec2_instance_ip" {
        value = aws_instance.ec2-1.public_ip
}