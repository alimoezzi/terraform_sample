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
resource "aws_security_group" "prod_web" {
  name = "prod_web"
  description = "Allow usual http https ports inboud only and all allowed for outbound" 

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # allow all ranges
  }

  egress { # outbound traffic
    from_port = 0 # allow all ports
    to_port = 0
    protocol = "-1" # allow all protocols
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Terraform": "true"
  }
}

