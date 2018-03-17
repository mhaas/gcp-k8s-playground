#!/bin/bash

export PROJECT_ID="$(gcloud config get-value project -q)"

gcloud container builds submit --tag gcr.io/${PROJECT_ID}/tensorflask .

