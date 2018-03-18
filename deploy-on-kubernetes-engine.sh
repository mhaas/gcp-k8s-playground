#!/bin/bash


function handle_error() {
    echo "Error occured on line $(caller). Exiting!" 1>&2
    exit 1
}

trap handle_error ERR

source common.sh

if ! gcloud container images describe "$IMAGE_NAME"; then
    echo "Sorry, image not found. Did you git push and wait?"
    exit 1
fi

echo "-- Creating Deployment."
echo "-- Prerequisite: Docker image for current COMMIT_SHA must be available on gcr.io!"

# kubectl run creates a "Deployment".
kubectl run tensorflask --image=${IMAGE_NAME} --port 8000

echo "-- Creating Service to expose Deployment"
kubectl expose deployment tensorflask --type=LoadBalancer --port 8000 --target-port 8000

echo "-- It will take a few minutes for the Service to be available."
echo "-- You can keep checking by running the following command until you see a value for EXTERNAL-IP!"

echo '$ kubectl get deployment tensorflask'

