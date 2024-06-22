variable project {
  type        = string
  default     = ""
  description = "Google Cloud Project ID"
}

variable region {
  type        = string
  default     = "us-east1"
  description = "Google Cloud Region"
}

variable credentials_file {
  type        = string
  default     = ""
  description = "Path to Google Cloud credentials file"
}
