output "vpc_id" {
  value = aws_vpc.terra_vpc.id
}
output "private_ip" {
    value = aws_instance.webservers.*.private_ip
}
output "public_ip" {
    value = aws_instance.webservers.*.public_ip
}
