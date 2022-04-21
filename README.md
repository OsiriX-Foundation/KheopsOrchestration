# Local Kubernetes Instance

Kubernetes orchestration example for running KHEOPS.

## Usage

* Modify the kheops-config.yml as needed.
* Copy secrets/secrets_template.yml to secrets/secrets.yml.
* Set values for the secrets.
* - kheops_auth_hmasecret, kheops_auth_hmasecret_post, kheops_client_dicomwebproxysecret, and kheops_client_zippersecret can be set to any random strings. A good option to generate random strings is `openssl rand -base64 32`.
* - kheops_authdb_pass is the password to the Postgres database for the kheops authorization server.

### Bring up Kubernetes objects

1. Configmaps `kubectl apply -f config`.
2. Secrets `kubectl apply -f secrets/secrets_template.yml`.
3. Services `kubectl apply -f services`.
4. Ingress `kubectl apply -f ingress.yml`.
5. Volumes `kubectl apply -f volumes`.
6. Deployments `kubectl apply -f deployments`.

### Delete up Kubernetes objects

1. Configmaps `kubectl delete -f config`.
2. Secrets `kubectl delete -f secrets/secrets_template.yml`.
3. Services `kubectl delete -f services`.
4. Ingress `kubectl delete -f ingress.yml`.
5. Volumes `kubectl delete -f volumes`
6. Deployments `kubectl delete -f deployments`.