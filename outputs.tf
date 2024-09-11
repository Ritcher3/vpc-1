output "private_subnet" {
  value       =  aws_subnet.private
  description = "private subnet cidr"
}

output "private_subnet_cidr_blocks" {
  value = [for subnet in aws_subnet.private : subnet.cidr_block]
  description = "List of CIDR blocks for the private subnets"
}

output "public_subnets" {
  value = [for subnet in aws_subnet.public : subnet.id]
}

output "vpc_id" {
  value       =  aws_vpc.main.id
  description = "main vpc"
}

output "firstpublic_subnet_id" {
  value = tolist(values(aws_subnet.public))[0].id
  description = "ID of the first public subnet"
}
