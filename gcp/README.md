# KK8 on GCP


## Requirements

- GCP project
- [Google Cloud SDK](https://cloud.google.com/sdk/docs/quickstart-debian-ubuntu)
- Kubectl cli
    ```sh
    gcloud components install kubectl
    ```
    Or [Kubectl install](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
- helm, [helm doc](https://helm.sh/docs/using_helm/)

## Cluster setup

https://cloud.google.com/sdk/gcloud/reference/container/clusters/create

```sh
gcloud container clusters create [CLUSTER_NAME] \
  --zone=[ZONE] \
  --project=[PROJECT_ID]
  --logging=SYSTEM,WORKLOAD
  --monitoring=NONE
```


```sh
gcloud container clusters get-credentials --zone [ZONE] cluster-prod --project [PROJECT_ID]>
gcloud container clusters get-credentials --zone [ZONE] cluster-staging --project [PROJECT_ID]>
```
