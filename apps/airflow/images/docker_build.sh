# aws ecr get-login-password --region us-east-1 --profile iamadmin-general | docker login --username AWS --password-stdin 211125525814.dkr.ecr.us-east-1.amazonaws.com
docker build -t hieupham0607/debezium-postgres:airflow -f ./apps/airflow/images/Dockerfile ./apps/airflow/images
# docker tag big-data-on-eks/airflow:latest 211125525814.dkr.ecr.us-east-1.amazonaws.com/big-data-on-eks/airflow:latest
docker push hieupham0607/debezium-postgres:airflow