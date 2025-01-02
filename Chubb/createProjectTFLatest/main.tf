terraform {
  required_version = ">= 0.13"
  required_providers {
    vra = {
      source  = "vmware/vra"
      version = "0.11.0"
    }
  }
}

provider "vra" {
  url           = var.url
  access_token   = var.access_token
  insecure      = true
}
