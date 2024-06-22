resource "google_project_service" "run" {
    service = "run.googleapis.com"
}

resource "google_cloud_run_service" "rshinycloudrun" {
    name = "rshinycloudrun"
    location = var.region
    project = var.project

    template {
        spec {
            containers {
                image = "gcr.io/rshinycloudrun/rshinycloudrun"
                resources {
                    limits {
                        cpu    = "1000m"
                        memory = "1024Mi"
                    }
                    requests {
                        cpu    = "500m"
                        memory = "500Mi"
                    }
                }
                ports {
                    container_port = 5000
                }
            }

            container_concurrency = 80
            timeout_seconds = 300
        }
        metadata {
            annotations = {
                "autoscaling.knative.dev/minScale" = 0
                "autoscaling.knative.dev/maxScale" = 10
            }
        }
    }

    traffic {
        percent         = 100
        latest_revision = true
    }

    depends_on = [google_project_service.run]
}

resource "google_cloud_run_service_iam_member" "allUsers" {
    service = google_cloud_run_service.rshinycloudrun.name
    location = var.region
    project = var.project
    role = "roles/run.invoker"
    member = "allUsers"
}

resource "google_cloud_run_domain_mapping" "rshinycloudrun" {
    name = "rshinycloudrun"
    location = var.region
    project = var.project
    spec {
        route_name = google_cloud_run_service.rshinycloudrun.name
    }
}
