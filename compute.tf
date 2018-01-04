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

resource "google_compute_instance" "default" {
 project = "${var.project}"
 zone = "${var.zone}"
 name = "bastion"
 machine_type = "f1-micro"
 boot_disk {
   initialize_params {
     image = "ubuntu-1604-xenial-v20170328"
   }
 }
 network_interface {
   network = "default"
   access_config {
   }
 }
}

output "instance_id" {
 value = "${google_compute_instance.default.self_link}"
}
