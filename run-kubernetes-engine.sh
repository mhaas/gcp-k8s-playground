#!/bin/bash

#!/bin/bash

source common.sh

kubectl run tensorflask --image=gcr.io/${PROJECT_ID}/tensorflask --port 8000

# Interesting commands

#kubectl cluster-info

