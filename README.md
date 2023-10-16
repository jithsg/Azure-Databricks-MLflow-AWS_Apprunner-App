[![Python Application Test with Github Actions](https://github.com/jithsg/Azure-Databricks-MLflow-AWS_Apprunner-App/actions/workflows/main.yml/badge.svg)](https://github.com/jithsg/Azure-Databricks-MLflow-AWS_Apprunner-App/actions/workflows/main.yml)
# ML app deployed to AWS App runner from AWS ECR using codespaces developed using Azure AutoML
![image](https://github.com/jithsg/mlflow-/assets/135303624/5bd33a6b-b55b-42ef-a7b1-8e3a059454b0)
In this project a kaggle dataset (gender classification) is used in AutoML setting in Azure Databricks platform.
Azure Databricks uses a cluster of 2-4 nodes (autoscaling) to develop a list of ML models. The best performing model is selected from the list. The model is downloaded as a .pkl file to github codespaces. The serialized (.pkl) model is used to build a ML app, which is dockerized and pushed into Amazon ECR. The app is finally run using AWS App Runner from te ECR repository.
