#!/bin/bash


function handle_error() {
    echo "Error occured on line $(caller). Exiting!" 1>&2
    exit 1
}

trap handle_error ERR

source common.sh

echo "-- Pulling the image from gcr.io!"

gcloud docker -- pull "${IMAGE_NAME}"

echo "-- Retrieving LoadBalancer external IP!"
IP="$(kubectl get service tensorflask -o jsonpath={.status.loadBalancer.ingress[0].ip})"
echo " -- Got $IP"

if [[ -z "${IP}" ]]; then
    echo "Sorry, could not find external LoadBalancer IP."
    echo "Try again in one or two minutes."
    exit 1
fi

echo "-- Launching client"
echo "-- This will take a few seconds."

docker run "${IMAGE_NAME}" \
    python3 simple_client.py \
        --download_mnist \
        --server=http://${IP}:8000/


