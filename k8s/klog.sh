#!/usr/bin/env bash
namespace=$(kubectl get pods --all-namespaces --show-all | grep -v Terminating | grep $1 | awk -F ' ' '{print $1}'|  head -1)
kubectl get pods --all-namespaces --show-all | grep $1 | grep -v Terminating | head -1 | awk -F ' ' '{print $2}' | xargs kubectl logs --namespace=$namespace -f
