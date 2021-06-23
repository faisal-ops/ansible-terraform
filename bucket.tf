provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "b" {
  bucket = var.bucket_name
  acl    = "private"
}

variable "region" {}

variable "bucket_name" {}
