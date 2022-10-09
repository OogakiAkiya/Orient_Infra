provider "aws"{
    region="ap-northeast-1"
    profile="mfa"
}

terraform {
   required_version = "= 1.2.9"
   /*
   backend "s3" {
    backet = "bucketName"
    key    = "terraform/open/terraform.tfstate"      //環境ごとのディレクトリを作成する
    region = "ap-northeast-1"
   }
   */
}

//data
data "aws_region" "current" {}
data "aws_caller_identity" "current" {}

data "aws_vpc" "open_vpc" {
  cidr_block = "10.0.0.0/16"
}
data "aws_subnet" "open_public_1a" {
  cidr_block = "10.0.10.0/24"
}
data "aws_subnet" "open_public_1c" {
  cidr_block = "10.0.11.0/24"
}
data "aws_subnet" "open_public_1d" {
  cidr_block = "10.0.12.0/24"
}
data "aws_subnet" "open_private_1a" {
  cidr_block = "10.0.20.0/24"
}
data "aws_subnet" "open_private_1c" {
  cidr_block = "10.0.21.0/24"
}
data "aws_subnet" "open_private_1d" {
  cidr_block = "10.0.22.0/24"
}

data aws_ssm_parameter amzn2_ami {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}