provider aws {}

resource "aws_s3_bucket" "bucket" {
    bucket = "nonsitter-apioid-52faf" 
}

resource "aws_s3_bucket_versioning" "versioning" {
    bucket = aws_s3_bucket.bucket.id
    versioning_configuration {
      status = "Enabled"
    }
}