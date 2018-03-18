# Deploying TensorFlask on Kubernetes Engine

* A Dockerfile for [TensorFlask](https://github.com/JoelKronander/TensorFlask)

* A set of scripts to deploy the resulting Docker image to GCP Kubernetes Engine


## Files

* build-cloud-container-builder.sh
  - script to build the Dockerfile via the Google Cloud Container Builder

* cloudbuild.yaml
  - declarative build instructions to build the Dockerfile via the container registry
  - an alternative to `build-cloud-container-builder.sh`, to be used via a build trigger
    (see below)

* `common.sh`
  - shared environment variables

* deploy-on-kubernetes-engine.sh
  - create a TensorFlask deployment and LoadBalancer service on an existing Kubernetes Engine cluster
  - requires (and checks) that the current `$IMAGE_NAME` is available on gcr.io for the current project

* Dockerfile
  - the Dockerfile for TensorFlask
  - automatically runs the server on container start, unless overriden
  - exposes port 8000

* run-client-locally.sh
  - runs the TensorFlask client locally against the deployed and exposed tensorflask instance
  - requires (and checks) that the LoadBalancer service is up and running

## General flow

````

# Create cluster and get credentials first, see ASCIIcast

# Wait a few minutes between each step. The scripts will check for their prerequsites

# Instead of build-cloud-container-builder.sh, you can also use the gcr.io build triggers
./build-cloud-container-builder.sh

./deploy-on-kubernetes-engine.sh

./run-client-locally.sh

````

Don't forget to clean up your services, deployments and clusters.

## Build image automatically via Cloud Container Builder

* Go to https://console.cloud.google.com/
* -> "Container Registry"
* -> "Build Triggers"
* Add a new build trigger and choose to use `cloudbuild.yaml` for build configuration

Deployment via `cloudbuild.yaml` is possible, but not configured right now.

## ASCIIcast of some concepts used here

[![asciicast](https://asciinema.org/a/wG7Zq3UC9yuqJctOo67JTQ07w.png)](https://asciinema.org/a/wG7Zq3UC9yuqJctOo67JTQ07w)
