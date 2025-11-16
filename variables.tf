variable "cluster_name" {
  description = "Name of the Kubernetes cluster"
  type        = string
  default     = "my-eks-cluster"
}

variable "s3_bucket_name" {
  description = "Name of the S3 bucket for backups"
  type        = string
  default     = "my-velero-backup-bucket"
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-west-2"
}

variable "aws_access_key" {
  description = "AWS access key"
  type        = string
}

variable "aws_secret_key" {
  description = "AWS secret key"
  type        = string
  sensitive   = true
}
