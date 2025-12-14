locals {
  # Validation stub values derived from inputs so outputs referenced by root work.
  cluster_id                         = var.cluster_name
  cluster_arn                        = "arn:aws:eks::000000000000:cluster/${var.cluster_name}"
  cluster_endpoint                   = "https://${var.cluster_name}.local"
  cluster_security_group_id          = "${var.cluster_name}-sg"
  cluster_certificate_authority_data = "MIID...FAKECERTDATA"
  node_group_id                      = "${var.cluster_name}-nodegroup-1"
  node_group_arn                     = "arn:aws:eks::000000000000:nodegroup/${var.cluster_name}/nodegroup-1"
  node_group_status                  = "ACTIVE"
}