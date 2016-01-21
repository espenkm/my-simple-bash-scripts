kubectl get pods --all-namespaces | sed "s/ .*//" | grep $1 | grep -v Terminating | head -1 | xargs kubectl logs -f
