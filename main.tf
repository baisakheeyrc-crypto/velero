provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = var.aws_region
}

resource "kubernetes_namespace" "velero" {
  metadata {
    name = "velero"
  }
}

resource "helm_release" "velero" {
  name       = "velero"
  namespace  = kubernetes_namespace.velero.metadata[0].name
  repository = "https://vmware-tanzu.github.io/helm-charts"
  chart      = "velero"
  version    = "2.30.0"

  set = [
    {
      name  = "configuration.provider"
      value = "aws"
    },
    {
      name  = "configuration.backupStorageLocation.name"
      value = "aws"
    },
    {
      name  = "configuration.backupStorageLocation.bucket"
      value = var.s3_bucket_name
    },
    {
      name  = "configuration.backupStorageLocation.config.region"
      value = var.aws_region
    },
    {
      name  = "credentials.secretContents.cloud"
      value = file("${path.module}/credentials-velero")
    }
  ]
}
