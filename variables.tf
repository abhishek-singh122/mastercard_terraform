variable "aws_region" {
    description = "AWS deployment region .."
	default = "ap-south-1"
}

variable "vpc_cidr" {
    description = "The CIDR block of the vpc"
	default = "10.20.0.0/16"
}

variable "public_subnets_cidr" {
	type = list
    description = "The CIDR block for the public subnet"
	default = ["10.20.1.0/24", "10.20.2.0/24"]
}

variable "private_subnets_cidr" {
  type        = list
  description = "The CIDR block for the private subnet"
  default = ["10.20.3.0/24"]
}

variable "azs" {
	type = list
    description = "The az that the resources will be launched"
	default = ["ap-south-1a"]
}

variable "webservers_ami" {
    description = "The AMI "
    default = "ami-08e0ca9924195beba"
}

variable "instance_type" {
    description = "The instance type "
    default = "t2.micro"
}