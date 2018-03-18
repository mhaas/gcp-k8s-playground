#!/bin/bash

source common.sh

#gcloud container clusters get-credentials cluster-1

echo "-- Creating Deployment."
echo "-- Prerequisite: Docker image for current COMMIT_SHA must be available on gcr.io!"

# kubectl run creates a "Deployment".
kubectl run tensorflask --image=gcr.io/${PROJECT_ID}/tensorflask:$COMMIT_SHA --port 8000

echo "-- Creating Service to expose Deployment"
kubectl expose deployment tensorflask --type=LoadBalancer --port 8000 --target-port 8000

echo "-- Now keep running the following command until you see a value for EXTERNAL-IP!"

echo '$ kubectl get deployment tensorflask'

# Interesting commands

#kubectl cluster-info

