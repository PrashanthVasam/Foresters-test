resource "null_resource" "execute_build_script" {
  provisioner "local-exec" {
    command = <<-EOT
      echo "Login to Azure using Service Principal"
      az login --service-principal -u var.spusername --tenant var.tenantID -p var.sppassword
      
      docker login -u var.dockerusername -p var.dockerpassword foresterstest.azurecr.io
      
      cd /opt/terraform-project/testproject/test-project
      mvn clean install
      
      docker build -f /opt/terraform-project/testproject/Dockerfile -t testproject:latest .
      
      docker tag testproject:latest foresterstest.azurecr.io/testproject:latest
      docker push foresterstest.azurecr.io/testproject:latest
    EOT
  }
}

