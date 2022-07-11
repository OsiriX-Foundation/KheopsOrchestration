## Local Kubernetes Instance

Kubernetes orchestration example for running KHEOPS.

## Usage

* Modify the kheops-config.yml as needed.
* Copy secrets/secrets_template.yml to secrets/secrets.yml.
* Set values for the secrets.
* - kheops_auth_hmasecret, kheops_auth_hmasecret_post, kheops_client_dicomwebproxysecret, and kheops_client_zippersecret can be set to any random strings. A good option to generate random strings is `openssl rand -base64 32`.
* - kheops_authdb_pass is the password to the Postgres database for the kheops authorization server.


## Bring up Kubernetes objects

3. Utils: `kubectl apply -k utils`.
4. Lavim: `kubectl apply -k lavim`.

## Set up a new project/site

1. Namespace: edit namespace
2. Postgres: edit namespace
3. Edit kheops-config.yml  // TODO: Edit keycloak realm
4. Create namespace & postgres
5. Connect and init pacsarc sql
6. Create a new S3 user
7. Create a new S3 namespace | On S3 : select namespace, enable ACLs and "Enable Hitachi API for Amazon S3"
8. Edit ldap-s3-unige-config : dcmURI, identity, credential, container
9. Deployments : edit namespace and postgresql URI
10. Ingress: edit namespace & host
11. Secrets: edit namespace, create secrets : `openssl rand -base64 32`
12. Services: edit namespace
13. Volumes: edit namespace
14. Kustomization: edit namespace
15. Apply kustomization
16. Edit ingress, connect to pacs, enable storage to S3, edit ingress