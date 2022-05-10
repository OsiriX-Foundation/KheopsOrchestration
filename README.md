## Local Kubernetes Instance

Kubernetes orchestration example for running KHEOPS.

## Usage

* Modify the kheops-config.yml as needed.
* Copy secrets/secrets_template.yml to secrets/secrets.yml.
* Set values for the secrets.
* - kheops_auth_hmasecret, kheops_auth_hmasecret_post, kheops_client_dicomwebproxysecret, and kheops_client_zippersecret can be set to any random strings. A good option to generate random strings is `openssl rand -base64 32`.
* - kheops_authdb_pass is the password to the Postgres database for the kheops authorization server.

## Initialise the pacsarc database

```
kubectl -n kheops-lavim get secrets kheops-lavim-authorization-pguser-kheops-lavim-authorization -o go-template='{{.data.password | base64decode}}'

kubectl -n kheops-lavim  port-forward "pod/kheops-lavim-pacsarc-instance1-grbw-0" 5432:5432

PG_CLUSTER_USER_SECRET_NAME=kheops-lavim-pacsarc-pguser-kheops-lavim-pacsarc

PGPASSWORD=$(kubectl get secrets -n kheops-lavim "${PG_CLUSTER_USER_SECRET_NAME}" -o go-template='{{.data.password | base64decode}}') \                                                   ─╯
PGUSER=$(kubectl get secrets -n kheops-lavim "${PG_CLUSTER_USER_SECRET_NAME}" -o go-template='{{.data.user | base64decode}}') \
PGDATABASE=$(kubectl get secrets -n kheops-lavim "${PG_CLUSTER_USER_SECRET_NAME}" -o go-template='{{.data.dbname | base64decode}}') \
psql -h localhost -f init.sql
```

## Bring up Kubernetes objects

1. Set up the postgres operator in postgres-operator-example : `kubectl apply -k kustomize/install/namespace` , `kubectl apply --server-side -k kustomize/install/default`
2. Set up the postgres databases: `kubectl apply -f lavim/postgres`. 
3. Utils: `kubectl apply -k utils`.
4. Lavim: `kubectl apply -k lavim`.