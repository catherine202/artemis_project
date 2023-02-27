# Artemis E-commerse Web-Application

## Pre Build process
before you  deploy the application please open port 5000 on Security Group and then follow the bellow commands.

```
yum install epel-release -y
yum install python-pip -y
pip install Flask
```
--- 
1. Please clone the repositary provided by Evolve Cyber to your environment.
Then scan the repositary using SonarCube. For that please go to https://sonarcloud.io/ and create an account (if you don't have one). Then connect it to your GitHub account and scan the repositary that has been clonned.

---
2. Create a GCP artifact repositary using terraform. For that you have to create main.ft, provider.tf, variables.tf and dev.tfvars files. dev.tfvars file has to be created in the separate folder called env.

The following code should be used for the main.tf and provider.tf files.

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
 Please create a variables.tf and dev.tfvars files that would correspond to the code above.

---
3. Please run the following commands once all the files were created. All commands have to be runned in the folder where files are being stored.
```
terraform init
terraform apply -var-file env/dev.tfvars
```
---
 4. Once the repository has been created you have to create a docker image and push it to the repository. (The Dockerfile was already created).
 To do so please run the following commands:​

```
docker build -t us-central1-docker.pkg.dev/PROJECT_ID/artemis/artemis:2.0.0  .
docker push us-central1-docker.pkg.dev/PROJECT_ID/artemis/artemis:2.0.0 
```

 To check if everything worked well please go to your GCP account, then search for Artifact Registry, open the corresponding registry folder and check if the image is there. Please allow the Artifact Registry to scan the image for the vulnerabilities. 

---
5. Please push all the changes to your repositary.
Once it's done, please go to GitHub Actions under the same repositary and create the simple workflow CI/CD pipelines to automate the process.
Please include the code provided by SonarCube to the pipelines so the scanning could be triggered everytime the changes are being pushed to the repo.
---


