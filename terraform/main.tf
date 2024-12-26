module "vpc" {
  source              = "./modules/VPC"
  vpc_cidr            = var.vpc_cidr               # CIDR block for the VPC
  public_subnet_cidr  = var.public_subnet_cidr     # CIDR block for the public subnet
  private_subnet_cidr = var.private_subnet_cidr    # CIDR block for the private subnet
}

module "iam" {
  source = "./modules/iam"
}

module "ec2" {
  source               = "./modules/EC2"
  public_subnet_id     = module.vpc.public_subnet_id  # Public subnet ID from VPC module
  private_subnet_id    = module.vpc.private_subnet_id # Private subnet ID from VPC module
  iam_instance_profile = module.iam.ec2_instance_profile # IAM instance profile from IAM module
  public_key_path      = var.public_key_path            # Path to the public SSH key
  allowed_ssh_cidr     = var.allowed_ssh_cidr           # CIDR block for SSH access
  web_instance_type    = var.web_instance_type          # Instance type for the web server
  db_instance_type     = var.db_instance_type           # Instance type for the database server
  key_name             = var.key_name                   # SSH key pair name
  vpc_id               = module.vpc.vpc_id    
   public_subnet_cidr   = var.public_subnet_cidr          # VPC ID from VPC module
}
