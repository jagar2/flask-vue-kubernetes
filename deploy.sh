#!/bin/bash


echo "Creating the volume..."

kubectl apply -f ./kubernetes/persistent-volume.yml
kubectl apply -f ./kubernetes/persistent-volume-claim.yml


echo "Creating the database credentials..."

kubectl apply -f ./kubernetes/secret.yml


echo "Creating the postgres deployment and service..."

kubectl create -f ./kubernetes/postgres-deployment.yml
kubectl create -f ./kubernetes/postgres-service.yml



echo "Creating the flask deployment and service..."

kubectl create -f ./kubernetes/flask-deployment.yml
kubectl create -f ./kubernetes/flask-service.yml


echo "Adding the ingress..."

minikube addons enable ingress
kubectl delete -A ValidatingWebhookConfiguration ingress-nginx-admission
kubectl apply -f ./kubernetes/minikube-ingress.yml


echo "Creating the vue deployment and service..."

kubectl create -f ./kubernetes/vue-deployment.yml
kubectl create -f ./kubernetes/vue-service.yml


# echo "Creating the volume..."

# kubectl apply -f ./kubernetes/persistent-volume.yml
# kubectl apply -f ./kubernetes/persistent-volume-claim.yml


# echo "Creating the database credentials..."

# kubectl apply -f ./kubernetes/secret.yml


# echo "Creating the postgres deployment and service..."

# kubectl create -f ./kubernetes/postgres-deployment.yml
# kubectl create -f ./kubernetes/postgres-service.yml
# POD_NAME=$(kubectl get pod -l service=postgres -o jsonpath="{.items[0].metadata.name}")
# kubectl exec $POD_NAME --stdin --tty -- createdb -U sample books


# echo "Creating the flask deployment and service..."

# kubectl create -f ./kubernetes/flask-deployment.yml
# kubectl create -f ./kubernetes/flask-service.yml
# FLASK_POD_NAME=$(kubectl get pod -l app=flask -o jsonpath="{.items[0].metadata.name}")
# kubectl exec $FLASK_POD_NAME --stdin --tty -- python manage.py recreate_db
# kubectl exec $FLASK_POD_NAME --stdin --tty -- python manage.py seed_db


# echo "Adding the ingress..."

# minikube addons enable ingress
# kubectl delete -A ValidatingWebhookConfiguration ingress-nginx-admission
# kubectl apply -f ./kubernetes/minikube-ingress.yml


# echo "Creating the vue deployment and service..."

# kubectl create -f ./kubernetes/vue-deployment.yml
# kubectl create -f ./kubernetes/vue-service.yml