#!/bin/bash

#cluster:gcp:prod

kubectl apply -f data/lb/private-nginx-ic.yaml
kubectl apply -f data/lb/public-nginx-ic.yaml
kubectl apply -f data/lb/issuers.yaml