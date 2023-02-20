# Artemis E-commerse Web-Application

## Pre Build process
be fore you  deploy the application please open port 5000 on Security Group and then follow the bellow commands.

```
yum install epel-release -y
yum install python-pip -y
pip install Flask
```
Create a GCP artifact repositary using terraform. The following code should be used:

```
resource "google_artifact_registry_repository" "my-repo" {
    provider = google-beta
    location = "Locadion ID"
    repository_id = "Repo ID"
    description = "Brief description on the repo"
    format = "DOCKER"
}
provider "google" {
    region = "us-centrali"
    zone = "us-centrall-c"
}
```
The following commands should be used:

bash setenv.sh
terraform init
terraform apply -var-file env/dev.tfvars


docker build -t us-central1-docker.pkg.dev/PROJECT_ID/artemis/artemis:2.0.0  .


docker push us-central1-docker.pkg.dev/PROJECT_ID/artemis/artemis:2.0.0 