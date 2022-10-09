provider "aws"{
    region="ap-northeast-1"
    profile="mfa"
}

terraform {
   required_version = "= 1.2.9"
}

//data
data "aws_region" "current" {}
data "aws_caller_identity" "current" {}