variable "vpc_cidr_block" {
  type        = string
  description = "CIDR block for the VPC"

}

variable "subnet_cidr_pub_block" {
  type        = list(string)
  description = "CIDR block for the public subnet"
}

variable "subnet_cidr_priv_block" {
  type        = list(string)
  description = "CIDR block for the private subnet"
}

variable "azs" {
  description = "List of Availability Zones"
  type        = list(string)
  default     = [data.aws_availability_zones.available.names]
}

variable "tags_all" {
  type        = string
  description = "tags"
}

variable "igw_attachment" {
  type        = bool
  description = "Whether to attach IGW to the VPC"
  default     = false
}

variable "subnet_bastion" {
  type        = bool
  description = "Whether to put bastion in own subnet" #recommended
  default     = true
}

variable "bastion_subnet_name" {
  type        = string
  description = "Name of the subnet for the bastion host"
  default     = "BastionSubnet"
}