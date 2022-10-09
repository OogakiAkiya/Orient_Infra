//------------------------------------
//IAM関係
//------------------------------------
resource "aws_iam_role" "base_instance"{
    name = "BaseInstanceRole"
    assume_role_policy = data.aws_iam_policy_document.base_instance.json
}

resource "aws_iam_instance_profile" "base_instance" {
  name = "BaseInstanceRole"
  role = aws_iam_role.base_instance.name
}

data "aws_iam_policy_document" "base_instance"{
    statement{
        effect = "Allow"
        actions = ["sts:AssumeRole"]
        principals{
            identifiers=["ec2.amazonaws.com"]
            type = "Service"
        }
    }
}

resource "aws_iam_role_policy_attachment" "base_instance_SSM"{
    role = aws_iam_role.base_instance.name
    policy_arn= "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
}
resource "aws_iam_role_policy_attachment" "base_instance_S3"{
    role = aws_iam_role.base_instance.name
    policy_arn= "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}
resource "aws_iam_role_policy_attachment" "base_instance_Managed"{
    role = aws_iam_role.base_instance.name
    policy_arn= "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

