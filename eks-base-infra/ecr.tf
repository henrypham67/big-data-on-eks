resource "aws_ecr_repository" "kafka_connect" {
  name                 = "big-data-on-eks/kafka-connect"
  image_tag_mutability = "MUTABLE"
  force_delete         = true
}

resource "aws_ecr_repository" "airflow" {
  name                 = "big-data-on-eks/airflow"
  image_tag_mutability = "MUTABLE"
  force_delete         = true
}

# Should be excluded after CI/CD pipeline implementation
resource "null_resource" "build_airflow_image" {
  provisioner "local-exec" {
    command = "apps/airflow/images/docker_build.sh"
  }
}