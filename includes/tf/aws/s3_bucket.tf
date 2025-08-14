provider aws { }

resource "aws_s3_bucket" "bucket" {
  bucket = "multilaminar-weaponeer-cc8b9" 
}


resource "aws_s3_bucket_public_access_block" "publicbucket" {
  bucket = aws_s3_bucket.bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_ownership_controls" "enable-acl" {
    bucket = aws_s3_bucket.bucket.id
    rule {
        object_ownership = "BucketOwnerPreferred"
    }
  
}

resource "aws_s3_object" "evelynfrimzy" {
    bucket = aws_s3_bucket.bucket.id
    key = "evelynfrimzy.jpg"
    source = "~/Pictures/Girls/evelynfrimzy.jpg"
    acl = "public-read"
}

