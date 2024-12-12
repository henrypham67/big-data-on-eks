To-do:

* Kafka
    * Deploy the Strimzi Operator; --ok
    * Deploy the Kafka cluster; --ok
    * Delpoy the Kafka Connect Cluster; --ok
    * Deploy the kafka Connect datagen connector; --ok
    * Deploy the kafka Connect iceberg connector:
        * AWS s3;
        * AWS Glue;
        * AWS IAM -> allow the pod identity to perform glue:GetTable (and other operations) over the Glue Catalog:
            * software.amazon.awssdk.services.glue.model.AccessDeniedException: User: arn:aws:sts::590183863248:assumed-role/general-eks-node-group-20241212132407424500000002/i-0ff8f32fc93a306bf is not authorized to perform: glue:GetTable on resource: arn:aws:glue:us-east-1:590183863248:catalog because no identity-based policy allows the glue:GetTable action (Service: Glue, Status Code: 400, Request ID: 20e826ab-1a7c-48e2-97cc-106fd2880c43)
        * Configure the connector;

* External Secrets Operator:
    * Trino was configured to execute after the ESO once it depends on the azure-entra-oauth2 secret to be created. But, ESO is trying to create the secret on the trino namespace which doesn't exists yet since trino wasn't deployed.