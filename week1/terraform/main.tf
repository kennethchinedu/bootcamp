provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "ter-form-k-bucket" {
  bucket = "ter-form-k-bucket"
}
