output "private_subnet" {
  value       =  aws_subnet.private
  description = "private subnet cidr"
}

output "public_subnet" {
  value       =  aws_subnet.public
  description = "private subnet cidr"
}

output "vpc_id" {
  value       =  aws_vpc.main.id
  description = "main vpc"
}

output "first_public_subnet_id" {
  value = tolist(values(aws_subnet.public))[0].id
  description = "ID of the first public subnet"
}