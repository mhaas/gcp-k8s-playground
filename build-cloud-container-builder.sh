#!/bin/bash

source common.sh

gcloud container builds submit --tag gcr.io/${PROJECT_ID}/tensorflask .

