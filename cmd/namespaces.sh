#!/bin/bash

# gcp:prod

kubectl create namespace prod
kubectl create namespace dev
kubectl create namespace cert-manager
kubectl create namespace monitoring