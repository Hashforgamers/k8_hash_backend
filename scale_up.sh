#!/bin/bash

# Namespace and deployment names
NAMESPACE="hash-backend"
DEPLOYMENTS=("user-app" "sales-app" "vendor-app" "mailhog" "mongo" "redis")

# Desired number of replicas to scale up to (e.g., 1)
REPLICAS=1

# Scale up the deployments
for DEPLOYMENT in "${DEPLOYMENTS[@]}"; do
  kubectl scale deployment "$DEPLOYMENT" --replicas=$REPLICAS -n $NAMESPACE
  if [ $? -eq 0 ]; then
    echo "Scaled up $DEPLOYMENT to $REPLICAS replicas."
  else
    echo "Failed to scale up $DEPLOYMENT."
  fi
done

echo "Scale-up script completed."
