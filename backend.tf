terraform {
 backend "gcs" {
   credentials = "${var.credential}"
   bucket  = "${var.bucket}"
   prefix  = "terraform/state"
 }
}