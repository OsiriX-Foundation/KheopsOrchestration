# Local Kubernetes Instance

Kubernetes orchestration example for running KHEOPS.

## Usage

* Modify the kheops-config.yml as needed.
* Copy secrets/secrets_template.yml to secrets/secrets.yml.
* Set values for the secrets.
* - kheops_auth_hmasecret, kheops_auth_hmasecret_post, kheops_client_dicomwebproxysecret, and kheops_client_zippersecret can be set to any random strings. A good option to generate random strings is `openssl rand -base64 32`.
* - kheops_authdb_pass is the password to the Postgres database for the kheops authorization server.

### Bring up Kubernetes objects

1. Set up the postgres operator in postgres-operator-example : `kubectl apply -k kustomize/install/namespace` , `kubectl apply --server-side -k kustomize/install/default`
2. Set up the postgres databases: `kubectl apply -f lavim/postgres`.
3. Get authorization password, save it in secrets : `kubectl -n kheops-lavim get secrets kheops-lavim-authorization-pguser-kheops-lavim-authorization -o go-template='{{.data.password | base64decode}}'`
4. Utils: `kubectl apply -k utils`.
5. Lavim: `kubectl apply -k lavim`.

### Delete up Kubernetes objects

1. Delete utils : `kubectl apply -k utils`.