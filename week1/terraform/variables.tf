#Setting up terraform variables for aws
variable "region" {
    description = "bucket location region"
    default = "us-east-1"
}

variable "bucket" {
    description = "Name of s3 bucket"
    default = "terraform-ken-bucket"
}