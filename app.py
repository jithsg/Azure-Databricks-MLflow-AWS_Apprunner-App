from fastapi import FastAPI, HTTPException
from pydantic import BaseModel, Field
from typing import List, Any
import mlflow.pyfunc
import pandas as pd
import traceback

app = FastAPI()

# Define the request body as a Pydantic model
class PredictRequest(BaseModel):
    columns: List[str] = Field(..., example=["firstName", "middleName", "lastName"])
    data: List[List[Any]] = Field(..., example=[["John", "M", "Doe"], ["Jane", "A", "Doe"]])

# Load your model
model_path = "/workspaces/mlflow-/model/"
try:
    model = mlflow.pyfunc.load_model(model_path)
except Exception as e:
    print(f"Error loading model: {e}")
    print(traceback.format_exc())  # Print the traceback if there's an error

@app.post("/predict/")
async def predict(request: PredictRequest):
    try:
        # Create a DataFrame from the request
        df = pd.DataFrame(request.data, columns=request.columns)

        # Make a prediction
        result = model.predict(df)

        # Return the result as a list
        return result.tolist()
    except Exception as e:
        # If an exception occurs, return an error message and the traceback
        return {"error": str(e), "trace": traceback.format_exc()}

# Optional: if you want to run the server using python script
if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)
