variable "project" {
  type = "string"
}

variable "zone" {
  type = "string"
}

variable "region" {}

provider "google" {
 region = "${var.region}"
}

resource "google_compute_address" "jumpbox-ip" {
  name = "jumpbox-ip"
  project = "${var.project}"
}

output "jumpbox_url" {
  value = "${google_compute_address.jumpbox-ip.address}:22"
}

output "external_ip" {
  value = "${google_compute_address.jumpbox-ip.address}"
}

output "director_address" {
  value = "https://${google_compute_address.jumpbox-ip.address}:25555"
}
