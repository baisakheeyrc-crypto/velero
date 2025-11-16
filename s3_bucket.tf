resource "aws_s3_bucket" "velero_backup" {
  bucket = var.s3_bucket_name
  region = var.aws_region
}

resource "aws_s3_bucket_versioning" "velero_backup" {
  bucket = aws_s3_bucket.velero_backup.id
  versioning_configuration {
    status = "Enabled"
  }
}
