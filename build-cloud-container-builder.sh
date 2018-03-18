#!/bin/bash

function handle_error() {
    echo "Error occured on line $(caller). Exiting!" 1>&2
    exit 1
}

trap handle_error ERR

source common.sh

gcloud container builds submit --tag ${IMAGE_NAME} .

