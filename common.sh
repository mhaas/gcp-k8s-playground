export PROJECT_ID="$(gcloud config get-value project -q)"
export COMMIT_SHA="$(git rev-parse HEAD)"
export IMAGE_NAME="gcr.io/${PROJECT_ID}/tensorflask:$COMMIT_SHA"
