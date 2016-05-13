#!/usr/bin/env bash

if [ "$#" -eq 1 ]; then
    kubectl config use-context $1
fi

if [ "$#" -eq 0 ]; then
    kubectl config view -o jsonpath='{.current-context}'
fi

echo
kubectl  cluster-info

