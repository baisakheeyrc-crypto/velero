resource "kubernetes_manifest" "backup_storage_location" {
  manifest = {
    apiVersion = "velero.io/v1"
    kind       = "BackupStorageLocation"
    metadata = {
      name      = "aws"
      namespace = "velero"
    }
    spec = {
      provider = "aws"
      objectStorage = {
        bucket = var.s3_bucket_name
        prefix = "velero"
      }
      config = {
        region = var.aws_region
      }
    }
  }
}
