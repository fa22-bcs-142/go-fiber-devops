# Kubernetes Manifests

Kubernetes configurations for Go Fiber application deployment. 

## Quick Start

```bash
# Deploy to dev
kubectl apply -k k8s/overlays/dev/

# Deploy to prod
kubectl apply -k k8s/overlays/prod/

# Check status
kubectl get all -n go-fiber-dev
