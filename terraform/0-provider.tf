provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

# this is for the production ready eks on aws
# provider "helm" {
#   kubernetes {
#     host = aws_eks_cluster.demo.endpoint
#     cluster_ca_certificate = base64decode()
#     exec {
#       api_version = "client.authentication.k8s.io/v1beta1"
#       args = ["eks", "get-token", "--cluster-name", aws_eks_cluster.demo.id]
#     }
#   }
# }
