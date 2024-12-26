# Fetch the latest Amazon Linux 2 AMI
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

# Web Server Instance
resource "aws_instance" "web" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = var.web_instance_type
  subnet_id              = var.public_subnet_id
  key_name               = var.key_name
  iam_instance_profile   = var.iam_instance_profile

  tags = {
    Name = "web-server"
  }
}

# Database Server Instance
resource "aws_instance" "db" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = var.db_instance_type
  subnet_id              = var.private_subnet_id
  key_name               = var.key_name
  iam_instance_profile   = var.iam_instance_profile

  tags = {
    Name = "db-server"
  }
}

# Security Group for Web Server
resource "aws_security_group" "web_sg" {
  name        = "web-sg"
  description = "Allow HTTP and SSH"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.allowed_ssh_cidr]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Security Group for Database Server
resource "aws_security_group" "db_sg" {
  name        = "db-sg"
  description = "Allow MySQL access"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [var.public_subnet_cidr] # Updated to use the CIDR block, not the subnet ID
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
