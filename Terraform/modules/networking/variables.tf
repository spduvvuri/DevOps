variable "cidr_block" {
  description = "cidr block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr_block" {
  description = "cidr block for subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "availability_zone" {
  description = "availability zone"
  type        = string
  default     = "us-east-1a"
}

variable "ipv6_cidr_block" {
  description = "ipv6 cidr block"
  type        = string
  default     = "::/0"
}

variable "default_route_cidr_block" {
  description = "default route cidr block"
  type        = string
  default     = "::/0"
}