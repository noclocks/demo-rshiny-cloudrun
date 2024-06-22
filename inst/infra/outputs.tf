output "url" {
    value = google_cloud_run_service.rshinycloudrun.status[0].url
}
