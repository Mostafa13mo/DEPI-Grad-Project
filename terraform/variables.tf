variable "key_name" {
  description = "Name of the SSH key pair"
  default     = "my-key"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "ami" {
  description = "Ubuntu 22.04 AMI ID in us-east-1"
  default     = "ami-0dba2cb6798deb6d8"
}
