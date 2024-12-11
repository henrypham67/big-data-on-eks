To-do:

* AWS Volumes:
 * Find a way to delete all volumes when the k8s resource is deleted

* Kafka
    * Deploy the Strimzi Operator; --ok
    * Deploy the Kafka cluster; --ok
    * Delpoy the Kafka Connect Cluster:
        * Create the AWS ECR; --ok
        * Create the Kafka Connect Cluster using the build mode and pointing to the AWS ECR repository previously created[https://strimzi.io/docs/operators/latest/deploying#kafka-connect-str] --ok

* External Secrets Operator:
    * Trino was configured to execute after the ESO once it depends on the azure-entra-oauth2 secret to be created. But, ESO is trying to create the secret on the trino namespace which doesn't exists yet since trino wasn't deployed.