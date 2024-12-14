To-do:

* DBT:
    * Deploy DBT
    * Integrate DBT with Iceberg tables;
    * Create the Silver and Gold layers using DBT;
* Airflow:
    * Deploy Airflow;
    * Run DBT project using Airflow;
* Superset:
    * Deploy Superset:
        * Authenticate using OAuth2 (Azure entra ID)
    * Configure the connection between Superset and Trino impersonating the user;
    * Create a Dashboard based on the Gold layer;