# Use the official Python image from the DockerHub
FROM python:3.8-slim

# Set the working directory in the container
WORKDIR /app

# Copy the dependencies file to the working directory
COPY requirements.txt .

# Install any dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the content of the local directory to the working directory
COPY . .

# Specify the command to run on container start
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]
