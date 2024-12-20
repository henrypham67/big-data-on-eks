To-do:

* Airflow:
    * Deploy Airflow; --ok
    * Run DBT project using Airflow (Astronomer Cosmos);
* DBT:
    * Deploy DBT --ok
    * Integrate DBT with Trino and Iceberg tables;
    * Create the Silver and Gold layers using DBT;
* Superset:
    * Deploy Superset:
        * Authenticate using OAuth2 (Azure entra ID)
    * Configure the connection between Superset and Trino impersonating the user;
    * Create a Dashboard based on the Gold layer;