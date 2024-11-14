To-do:

* Kafka
    * Deploy the Strimzi Operator; --ok
    * Deploy the Kafka cluster; --ok
    * Delpoy the Kafka Connect Cluster;
        * Create the AWS ECR; --ok
        * Create a Role to push image to the ECR repo [https://docs.aws.amazon.com/pt_br/AmazonECR/latest/userguide/ECR_on_EKS.html];
            * The EKS should be able to pull images by default since its role has a policy attached for it [https://github.com/terraform-aws-modules/terraform-aws-eks/blob/97a08c8aff5dbf51a86b4c8cd88a858336cd0208/modules/eks-managed-node-group/main.tf#L530]
            * If the EKS cluster doesn't have authorization to push images, use the 'iam_role_additional_policies' parameter to attach a policy that grants the push action. You need to create the policy using Terraform;
        * Create the Kafka Connect Cluster using the build mode and pointing to the AWS ECR repository previously created[https://strimzi.io/docs/operators/latest/deploying#kafka-connect-str]
        * [https://stackoverflow.com/questions/72433169/strimzi-loading-container-into-aws-ecr-error-checking-push-permissions]
        * Kaniko (tool used by strimzi to build and push the image to the repository) AWS IAM configuration example: [https://dev.to/marocz/building-container-images-securely-on-aws-eks-with-kaniko-153n]
        * In last case, let's build the image out of strimzi CRD, build and push it to AWS ECR using a CI/CD tool;

* External Secrets Operator:
    * Trino was configured to execute after the ESO once it depends on the azure-entra-oauth2 secret to be created. But, ESO is trying to create the secret on the trino namespace which doesn't exists yet since trino wasn't deployed. 