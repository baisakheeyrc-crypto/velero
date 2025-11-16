resource "kubernetes_manifest" "volume_snapshot_location" {
  manifest = {
    apiVersion = "velero.io/v1"
    kind       = "VolumeSnapshotLocation"
    metadata = {
      name      = "aws"
      namespace = "velero"
    }
    spec = {
      provider = "aws"
      config = {
        region = var.aws_region
      }
    }
  }
}
