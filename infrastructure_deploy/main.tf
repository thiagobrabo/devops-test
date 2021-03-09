provider "google" {
    credentials = file(var.credentials_file)
    project = var.project
    region = var.region
}

resource "random_id" "instance_id" {
    byte_length = 8  
}

