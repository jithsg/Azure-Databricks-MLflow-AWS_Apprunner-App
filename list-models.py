model_name = "model2"
from mlflow.tracking import MlflowClient
client = MlflowClient()
model_details = client.get_registered_model(model_name)
print(model_details)
