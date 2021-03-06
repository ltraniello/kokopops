# KOKOPOPS

cli and repository template for kubernetes iac on GKE.

## Cluster setup

[GCP](gcp/README.md)

## Instal

```sh
sudo make install
```

## Usage

Use kops from this directory, it needs to lookup files in *cmd*

List commands

```sh
kops commands
```

shell in /cmd  are run using

```sh
kops deploy foo
```

## Repo structure

- */templates*

Helm templates

- */cmd*

shell executed by `kops deploy [CMD]`
Add as many *.sh* as you need.

shell files require a line which reference the targeted kubernetes cluster

- */data*

Files required by cmd exec, helm values, kubernetes yaml files ...


- */test*

Tester c'est douter


## Samples 

This template comes with samples, those are components often required to run a kubernetes cluster.

### LetsEncrypt certs

Instal certmanager in cert-manager namespace.

```sh
kops deploy certmanager
```

Use Issuer or ClusterIssuer to issue certs.

Issuers are referenced in Ingress resources:

```yaml
-cert-manager.io/issuer: public
-kubernetes.io/tls-acme: "true"
```

### LB

```sh
kops deploy lb
```

ingress-controllers are referenced in *Ingress* resources:

```yaml
-kubernetes.io/ingress.class: public
```

### Monitoring / alerting

GKE has builtin monitoring if the cluster is created using

```sh
  --monitoring=SYSTEM,WORKLOAD
```

You can also disable WORKLOAD monitoring and use NodeExporter/Prometheus/AlertManager/Grafana instead.

```sh
kops deploy monitoring
```

