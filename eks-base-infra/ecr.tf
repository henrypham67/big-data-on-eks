resource "aws_ecr_repository" "kafka_connect" {
  name                 = "big-data-on-eks/kafka-connect"
  image_tag_mutability = "MUTABLE"
  force_delete = true
}