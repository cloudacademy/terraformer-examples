resource "google_compute_instance" "tfer--data-002D-server-002D-prod" {
  boot_disk {
    auto_delete = "true"
    device_name = "data-server-prod"

    initialize_params {
      image = "https://www.googleapis.com/compute/v1/projects/cos-cloud/global/images/cos-stable-85-13310-1041-24"
      size  = "10"
      type  = "pd-standard"
    }

    mode   = "READ_WRITE"
    source = "https://www.googleapis.com/compute/v1/projects/cloudacademyprod/zones/us-central1-a/disks/data-server-prod"
  }

  can_ip_forward      = "false"
  deletion_protection = "false"
  enable_display      = "false"

  labels = {
    app          = "webserver"
    container-vm = "cos-stable-85-13310-1041-24"
    environment  = "prod"
    team         = "devops"
  }

  machine_type = "e2-micro"

  metadata = {
    gce-container-declaration = "spec:\n  containers:\n    - name: data-server-prod\n      image: gcr.io/contianer-images/busybox\n      env:\n        - name: KEY\n          value: VALUE\n      stdin: false\n      tty: true\n  restartPolicy: OnFailure\n\n# This container declaration format is not public API and may change without notice. Please\n# use gcloud command-line tool or Google Cloud Console to run Containers on Google Compute Engine."
    google-logging-enabled    = "true"
  }

  name = "data-server-prod"

  network_interface {
    access_config {
      nat_ip       = "35.239.34.3"
      network_tier = "PREMIUM"
    }

    network            = "https://www.googleapis.com/compute/v1/projects/cloudacademyprod/global/networks/default"
    network_ip         = "10.128.0.3"
    subnetwork         = "https://www.googleapis.com/compute/v1/projects/cloudacademyprod/regions/us-central1/subnetworks/default"
    subnetwork_project = "cloudacademyprod"
  }

  project = "cloudacademyprod"

  scheduling {
    automatic_restart   = "true"
    on_host_maintenance = "MIGRATE"
    preemptible         = "false"
  }

  service_account {
    email  = "1005939133167-compute@developer.gserviceaccount.com"
    scopes = ["https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/trace.append", "https://www.googleapis.com/auth/monitoring.write"]
  }

  shielded_instance_config {
    enable_integrity_monitoring = "true"
    enable_secure_boot          = "false"
    enable_vtpm                 = "true"
  }

  tags = ["http-server", "https-server"]
  zone = "us-central1-a"
}

resource "google_compute_instance" "tfer--web-002D-server-002D-prod" {
  boot_disk {
    auto_delete = "true"
    device_name = "web-server-prod"

    initialize_params {
      image = "https://www.googleapis.com/compute/v1/projects/cos-cloud/global/images/cos-stable-85-13310-1041-24"
      size  = "10"
      type  = "pd-standard"
    }

    mode   = "READ_WRITE"
    source = "https://www.googleapis.com/compute/v1/projects/cloudacademyprod/zones/us-central1-a/disks/web-server-prod"
  }

  can_ip_forward      = "false"
  deletion_protection = "false"
  enable_display      = "false"

  labels = {
    app          = "webserver"
    container-vm = "cos-stable-85-13310-1041-24"
    environment  = "prod"
    team         = "devops"
  }

  machine_type = "e2-micro"

  metadata = {
    gce-container-declaration = "spec:\n  containers:\n    - name: web-server-prod\n      image: gcr.io/contianer-images/busybox\n      env:\n        - name: KEY\n          value: VALUE\n      stdin: false\n      tty: true\n  restartPolicy: OnFailure\n\n# This container declaration format is not public API and may change without notice. Please\n# use gcloud command-line tool or Google Cloud Console to run Containers on Google Compute Engine."
    google-logging-enabled    = "true"
  }

  name = "web-server-prod"

  network_interface {
    access_config {
      nat_ip       = "35.232.52.84"
      network_tier = "PREMIUM"
    }

    network            = "https://www.googleapis.com/compute/v1/projects/cloudacademyprod/global/networks/default"
    network_ip         = "10.128.0.2"
    subnetwork         = "https://www.googleapis.com/compute/v1/projects/cloudacademyprod/regions/us-central1/subnetworks/default"
    subnetwork_project = "cloudacademyprod"
  }

  project = "cloudacademyprod"

  scheduling {
    automatic_restart   = "true"
    on_host_maintenance = "MIGRATE"
    preemptible         = "false"
  }

  service_account {
    email  = "1005939133167-compute@developer.gserviceaccount.com"
    scopes = ["https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/monitoring.write", "https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/trace.append", "https://www.googleapis.com/auth/service.management.readonly"]
  }

  shielded_instance_config {
    enable_integrity_monitoring = "true"
    enable_secure_boot          = "false"
    enable_vtpm                 = "true"
  }

  tags = ["https-server", "http-server"]
  zone = "us-central1-a"
}
