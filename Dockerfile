# Use the official Python image from the DockerHub
FROM python:3.8-slim

# These lines are optional: they allow you to install packages from a user account
# if you're behind a proxy that requires authentication
# ARG username
# ARG password

# Set the working directory in the container
WORKDIR /app

# Copy the dependencies file to the working directory
COPY requirements.txt .

# Install any dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the content of the local src directory to the working directory
COPY ./src/ /app/

# Specify the command to run on container start
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]
