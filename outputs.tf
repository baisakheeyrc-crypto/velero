output "velero_namespace" {
  value = kubernetes_namespace.velero.metadata[0].name
}

output "s3_bucket_name" {
  value = aws_s3_bucket.velero_backup.bucket
}
