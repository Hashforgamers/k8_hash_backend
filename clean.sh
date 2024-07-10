kubectl delete deployment --all -n hash-backend
kubectl delete pod --all -n hash-backend
kubectl delete service --all -n hash-backend
kubectl delete configmap --all -n hash-backend
kubectl delete secret --all -n hash-backend
kubectl delete ingress --all -n hash-backend
kubectl delete namespace hash-backend
