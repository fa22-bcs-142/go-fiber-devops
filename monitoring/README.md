# Monitoring Stack

## Deploy
kubectl create namespace monitoring
kubectl apply -f prometheus/
kubectl apply -f grafana/

## Access
- Prometheus: http://localhost:30090
- Grafana:  http://localhost:30030 (admin/admin)
