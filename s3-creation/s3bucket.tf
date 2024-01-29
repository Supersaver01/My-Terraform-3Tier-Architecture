#Bucket Creation
resource "aws_s3_bucket" "tierbucket" {
  bucket = "tf-tier-bucket"

  tags = {
    Name        = "TierArchitecture"
    Environment = "Dev"
  }
}

#Enabling Versioning
resource "aws_s3_bucket_versioning" "tierbucket_versioning" {
  bucket = aws_s3_bucket.tierbucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

#Creating an Upload Folder
resource "aws_s3_object" "uploads_folder" {
  bucket = "tf-tier-bucket"
  key    = "uploads"

}