To-do:

* Kafka
    * Deploy the Strimzi Operator; --ok
    * Deploy the Kafka cluster; --ok
    * Delpoy the Kafka Connect Cluster; --ok
    * Deploy the kafka Connect datagen connector; --ok
    * Deploy the kafka Connect iceberg connector:
        * AWS s3;
        * AWS Glue;
        * Configure the connector;

* External Secrets Operator:
    * Trino was configured to execute after the ESO once it depends on the azure-entra-oauth2 secret to be created. But, ESO is trying to create the secret on the trino namespace which doesn't exists yet since trino wasn't deployed.