provider "aws" {
  region = "eu-west-1"
}
resource "aws_s3_bucket" "mapfre-gitops-fbohorq" {
  bucket = "mapfre-gitops-fbohorq"
    tags = {
    Name        = "mapfre-gitops-fbohorq"
    Environment = "RetoKairos"
  }
}
resource "aws_s3_bucket_acl" "mapfre-gitops-fbohorq" {
  bucket = aws_s3_bucket.mapfre-gitops-fbohorq.id
  acl    = "public-read"
}
resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.mapfre-gitops-fbohorq.id
  key    = "index.html"
  source = "./index.html"
  etag = filemd5("./index.html")
}
