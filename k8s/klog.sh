#!/usr/bin/env bash
kubectl get pods --all-namespaces | grep $1 | grep -v Terminating | head -1 | awk -F ' ' '{print $2}' | xargs kubectl logs -f
