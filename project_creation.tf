provider "google" {
  project = "${var.project_init}"
  region  = "${var.region}"
}

data "google_iam_policy" "admin" {
  binding {
    role = "${var.roles}"

    members = [
      "user:${var.user}",
    ]
  }
}

resource "google_project" "terraform_sandbox_create_project" {
  name       = "${var.projects}"
  project_id = "${var.projects}"
  folder_id  = "${var.parent_folder}"
  billing_account  = "${var.billing_id}"
}


resource "google_project_service" "terraform_sandbox_enable_api" {
  depends_on = [google_project.terraform_sandbox_create_project]
  project = "${var.projects}"
  for_each = toset([
    "container.googleapis.com",
    "containerregistry.googleapis.com",
    "bigquerystorage.googleapis.com",
    "bigquery.googleapis.com",
    "compute.googleapis.com",
    "monitoring.googleapis.com",
    "logging.googleapis.com",
    "serviceusage.googleapis.com",
    "cloudbilling.googleapis.com",
    "cloudfunctions.googleapis.com",
    "cloudbuild.googleapis.com",
    "cloudasset.googleapis.com",
    "binaryauthorization.googleapis.com",
    "datastore.googleapis.com",
    "clouddebugger.googleapis.com",
    "sql-component.googleapis.com",
    "storage-component.googleapis.com",
    "storage.googleapis.com",
    "cloudtrace.googleapis.com",
    "cloudapis.googleapis.com",
    "storage-api.googleapis.com",
    "servicemanagement.googleapis.com",
    "iam.googleapis.com",
    "cloudresourcemanager.googleapis.com",
  ])
  service = each.key
  timeouts {
    create = "30m"
    update = "40m"
  }
  disable_dependent_services=true
}

resource "google_project_iam_policy" "terraform_sandbox_grant_role" {
  depends_on = [google_project.terraform_sandbox_create_project]
  project     = "${var.projects}"
  policy_data = data.google_iam_policy.admin.policy_data
}