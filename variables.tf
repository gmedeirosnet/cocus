# COCUS - DEVOPS CHALLENGE
# by Gutemberg Medeiros (gmedeiros@gmail.com)

variable "vpc_cidr" {
  description = "The default VPC CIDR block."
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "The default subnet CIDR."
  type        = string
  default     = "10.0.1.0/24"
}

variable "subnet2_cidr" {
  type    = string
  default = "10.0.2.0/24"
}