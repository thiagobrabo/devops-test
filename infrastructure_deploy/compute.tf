resource "google_compute_network" "vpc_network" {
    name = "devopstest-network"
}


resource "google_compute_firewall" "vpc_network" {
    name = "web-firewall"
    network = google_compute_network.vpc_network.name

    allow {
        protocol = "icmp"
    }

    allow {
        protocol = "tcp"
        ports = ["80", "443"]
    }

    source_ranges = ["0.0.0.0/0"]
    target_tags = ["web"]
}


resource "google_compute_instance_template" "tpl" {
    name = "tpl-devopstest"
    description = "This template is used to create web server instance for devopstest"
    machine_type = var.machine_types
    can_ip_forward = true
    
    labels = {
      "environment" = "dev"
    }

    disk {
        source_image = "cos-cloud/cos-stable"
        auto_delete = true
        disk_size_gb = 10
        boot = true
    }

    network_interface {
        network = google_compute_network.vpc_network.name
        access_config {

        }
    }

    tags = [ "web", "dev" ]

    scheduling {
        automatic_restart = true
    }

/*     metadata = {
      ssh-keys = file(var.ssh_keys_file)
    } */
}


resource "google_compute_instance_from_template" "tpl" {
    name = "devopstest-vm-${random_id.instance_id.hex}"
    zone = var.zone

    source_instance_template = google_compute_instance_template.tpl.id
    can_ip_forward = true

    tags = [ "web", "dev" ]
} 

/* 
resource "google_compute_instance_group" "tpl" {
    name = "terraform-tpl"
    zone = var.zone
    network = google_compute_network.vpc_network.name
    }


resource "google_compute_instance_group" "webdev" {
    name = "terraform-webdev"
    description = "Terraform devopstest instance group"

    instances = [ 
        google_compute_instance_template.tpl.id,
        google_compute_instance_template.tpl2.id,
        google_compute_instance_template.tpl3.id,    
     ] 

    named_port {
      name = "http"
      port = "8080"
    }

    named_port {
      name = "https"
      port = "443"
    }

    zone = var.zone
} */

