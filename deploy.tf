# deploy.tf
resource "null_resource" "execute_deploy_script" {
  depends_on = [azurerm_kubernetes_cluster.aks_cluster]
  provisioner "local-exec" {
    command = <<-EOT
      az aks get-credentials --resource-group ${var.resourcegroupname} --name ${var.aksname}
      kubectl create namespace ${var.namespace}
      kubectl get ns

      kubectl apply -f deployment.yml -n ${var.namespace}
      kubectl apply -f service.yml -n ${var.namespace}

      kubectl get service -n ${var.namespace}
      kubectl get service -n ${var.namespace}
      kubectl get service -n ${var.namespace}
      kubectl get service -n ${var.namespace}
      kubectl get service -n ${var.namespace}
    EOT
  }
}

