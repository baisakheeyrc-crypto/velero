resource "kubernetes_manifest" "backup_schedule" {
  manifest = {
    apiVersion = "velero.io/v1"
    kind       = "Schedule"
    metadata = {
      name      = "daily-backup"
      namespace = "velero"
    }
    spec = {
      schedule = "0 1 * * *"
      template = {
        includedNamespaces = ["*"]
        storageLocation    = "aws"
      }
    }
  }
}
