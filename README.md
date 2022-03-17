# Google - Kubernetes - CloudSQL - Cloud Healthcare

Kubernetes orchestration example for running KHEOPS using:
- Google GKE
- CloudSQL PostgreSQL database for Authorization Server data persistence
- Cloud Healthcare DICOM Datastore for DICOM data persistence
- External Keycloak Server

## Usage

* Modify the kheops-config.yml as needed.
* Copy secrets/secrets_template.yml to secrets/secrets.yml.
* Set values for the secrets.
* - kheops_auth_hmasecret, kheops_auth_hmasecret_post, kheops_client_dicomwebproxysecret, and kheops_client_zippersecret can be set to any random strings. A good option to generate random strings is `openssl rand -base64 32`.
* - kheops_authdb_pass is the password to the Postgres database for the kheops authorization server.
* Modify ingress.yml to set correct values for the `spec: domains` and  `kubernetes.io/ingress.global-static-ip-name`.

### Bring up Kubernetes objects

1. configmaps `kubectl apply -f config`.
2. secrets `kubectl apply -f secrets/secrets_template.yml`.
3. services `kubectl apply -f services`.
4. ingress `kubectl apply -f ingress.yml`.
5. depolyments `kubectl apply -f deployments`.