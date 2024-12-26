# CIDR block for the VPC
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

# CIDR block for the public subnet
variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
}

# CIDR block for the private subnet
variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  default     = "10.0.2.0/24"
}

# Path to the public SSH key
variable "public_key_path" {
  description = "Path to the public SSH key"
  type        = string
}

# CIDR block for SSH access
variable "allowed_ssh_cidr" {
  description = "CIDR block allowed to SSH into the EC2 instance"
  type        = string
}

# Instance type for the web server
variable "web_instance_type" {
  description = "Instance type for the web server"
  default     = "t2.micro"
}

# Instance type for the database server
variable "db_instance_type" {
  description = "Instance type for the database server"
  default     = "t2.micro"
}

# Name of the SSH key pair
variable "key_name" {
  description = "Name of the SSH key pair"
  type        = string
}
