# IAM Role for EC2
resource "aws_iam_role" "ec2_role" {
  name               = "ec2-role-${random_string.suffix.result}" # Unique role name
  assume_role_policy = data.aws_iam_policy_document.ec2_assume_role.json
}

# Assume Role Policy Document
data "aws_iam_policy_document" "ec2_assume_role" {
  statement {
    effect = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

# Random Suffix for Unique Naming
resource "random_string" "suffix" {
  length  = 6
  special = false
  upper   = false
}

# IAM Instance Profile
resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2-instance-profile1"
  role = aws_iam_role.ec2_role.name # Reference the updated IAM role name
}
