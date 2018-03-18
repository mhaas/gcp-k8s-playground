# Deploying TensorFlask on Kubernetes Engine

* A Dockerfile for [TensorFlask](https://github.com/JoelKronander/TensorFlask)

* A set of scripts to deploy the resulting Docker image to GCP Kubernetes Engine


## Build image automatically via Cloud Container Builder

* Go to https://console.cloud.google.com/
* -> "Container Registry"
* -> "Build Triggers"
* Add a new build trigger and choose to use `cloudbuild.yaml` for build configuration

Deployment via `cloudbuild.yaml` is possible, but not configured right now.

## ASCIIcast of some concepts used here

[![asciicast](https://asciinema.org/a/wG7Zq3UC9yuqJctOo67JTQ07w.png)](https://asciinema.org/a/wG7Zq3UC9yuqJctOo67JTQ07w)
