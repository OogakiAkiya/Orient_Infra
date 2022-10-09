provider "aws"{
    region="ap-northeast-1"
    profile="mfa"
}

terraform {
   required_version = "= 1.2.9"
   /*
   backend "s3" {
    backet = "bucketName"
    key    = "terraform/terraform.tfstate"
    region = "ap-northeast-1"
   }
   */
}

//data
data "aws_region" "current" {}
data "aws_caller_identity" "current" {}
