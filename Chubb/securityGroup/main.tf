terraform {
  required_version = ">= 0.13"
  required_providers {
    nsxt = {
      source = "vmware/nsxt"
      version = 3.8.0"
    }
  }
}

provider "nsxt" {
  host                 = "172.16.20.103"
  username             = "admin"
  password             = "Bpovtmg1!Bpovtmg1!"
  allow_unverified_ssl = true
  max_retries          = 2
}
