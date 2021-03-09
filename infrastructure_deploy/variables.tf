variable "project" {
    type = string
 }

variable "credentials_file" {

}

/* variable "ssh_keys_file" {
  
}
 */
variable "region" {
    type = string
    default = "southamerica-east1"
}

variable "zone" {
    default = "southamerica-east1-c"
}

variable "web_instance_count" {
    type    = number
    default = 1
}

variable "environment" {
    type    = string
    default = "dev"
}

variable "machine_types" {
    type    = string
    default = "f1-micro"
}   
