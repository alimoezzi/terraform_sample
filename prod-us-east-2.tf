provider "aws" { 
  profile = "default"
  region = "us-east-2"
}

resource "aws_s3_bucket" "prod_tf_sample_aws_bucket" {
  bucket = "sarme-tf-sample-2021"
  acl = "private"
}

resource "aws_default_vpc" "default" {
  
}

