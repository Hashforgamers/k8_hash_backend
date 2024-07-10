#!/bin/bash

# Directory containing Kubernetes YAML files
YAML_DIR="k8s"

# Check if YAML directory exists
if [ ! -d "$YAML_DIR" ]; then
  echo "Error: Directory $YAML_DIR does not exist."
  exit 1
fi

# Create namespace if it doesn't exist
kubectl create namespace hash-backend --dry-run=client -o yaml | kubectl apply -f -

# Apply ConfigMaps
kubectl apply -f $YAML_DIR/config-map/configmap.yaml -n hash-backend

# Apply Secrets
kubectl apply -f $YAML_DIR/secrets/secret.yaml -n hash-backend

# Apply Persistent Volume Claims (if needed)
kubectl apply -f $YAML_DIR/mongo-pvc.yaml -n hash-backend

# Apply Services
kubectl apply -f $YAML_DIR/services/mongo-service.yaml -n hash-backend
kubectl apply -f $YAML_DIR/services/redis-service.yaml -n hash-backend
kubectl apply -f $YAML_DIR/services/mailhog-service.yaml -n hash-backend
kubectl apply -f $YAML_DIR/services/user-app-service.yaml -n hash-backend
kubectl apply -f $YAML_DIR/services/sales-app-service.yaml -n hash-backend
kubectl apply -f $YAML_DIR/services/vendor-app-service.yaml -n hash-backend

# Apply Deployments
kubectl apply -f $YAML_DIR/deployments/mongo-deployment.yaml -n hash-backend
kubectl apply -f $YAML_DIR/deployments/redis-deployment.yaml -n hash-backend
kubectl apply -f $YAML_DIR/deployments/mailhog-deployment.yaml -n hash-backend
kubectl apply -f $YAML_DIR/deployments/user-app-deployment.yaml -n hash-backend
kubectl apply -f $YAML_DIR/deployments/sales-app-deployment.yaml -n hash-backend
kubectl apply -f $YAML_DIR/deployments/vendor-app-deployment.yaml -n hash-backend

# Apply Ingress (if needed)
kubectl apply -f $YAML_DIR/ingress/ingress.yaml -n hash-backend

echo "Deployment script completed."
