#!/usr/bin/env bash
podname=$(kubectl get pods --all-namespaces | grep -v Terminating | awk -F ' ' '{print $2}' | grep $1 | head -1)
givencommand=$2
cmd=${givencommand:-"bash"}
kubectl -it exec $podname $cmd
