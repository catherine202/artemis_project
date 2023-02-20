resource "google_artifact_registry_repository" "my-repo" {
    # provider = google-beta
    location = "var.region"
    repository_id = "var.repositary_id"
    description = "var.description"
    format = "DOCKER"
    project = "var.project_id"
}




