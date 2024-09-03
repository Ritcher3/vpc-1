output "private_subnet" {
  value       =  aws_subnet.private
  description = "private subnet cidr"
}

output "public_subnet" {
  value       =  aws_subnet.public
  description = "private subnet cidr"
}
