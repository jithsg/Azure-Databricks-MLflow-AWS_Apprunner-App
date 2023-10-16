install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt
format:
	black *.py
lint:
	pylint --disable=R,C,W1203,W1202,W0703 *.py
deploy:
	aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 185183796631.dkr.ecr.us-east-1.amazonaws.com
	docker build -t databricks-mlflow .
	docker tag databricks-mlflow:latest 185183796631.dkr.ecr.us-east-1.amazonaws.com/databricks-mlflow:latest
	docker push 185183796631.dkr.ecr.us-east-1.amazonaws.com/databricks-mlflow:latest

all: install format lint
