To-do:

* General:
    * Review the entire project and set variables as much as possible when needed;

* Airflow:
    * Deploy Airflow; --ok
    * Run DBT project using Airflow (Astronomer Cosmos);
* DBT:
    * Deploy DBT --ok
    * Integrate DBT with Trino and Iceberg tables; --ok? (verify if the password authentication method is working when using DBT. It's working using the CLI) [I'm getting and 'Unauthorized error']
    * Create the Silver and Gold layers using DBT;
* Superset:
    * Deploy Superset:
        * Authenticate using OAuth2 (Azure entra ID)
    * Configure the connection between Superset and Trino impersonating the user;
    * Create a Dashboard based on the Gold layer;