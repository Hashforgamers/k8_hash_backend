#!/bin/bash

# Namespace and deployment names
NAMESPACE="hash-backend"
DEPLOYMENTS=("user-app" "sales-app" "vendor-app" "mailhog" "mongo" "redis")

# Desired number of replicas to scale down to (0)
REPLICAS=0

# Scale down the deployments
for DEPLOYMENT in "${DEPLOYMENTS[@]}"; do
  kubectl scale deployment "$DEPLOYMENT" --replicas=$REPLICAS -n $NAMESPACE
  if [ $? -eq 0 ]; then
    echo "Scaled down $DEPLOYMENT to $REPLICAS replicas."
  else
    echo "Failed to scale down $DEPLOYMENT."
  fi
done

echo "Scale-down script completed."
