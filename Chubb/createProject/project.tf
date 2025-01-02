data "vra_zone" "this" {
  name = var.zone_name
}

data "catalog_source" "this" {
  name = var.content_source
}

resource "vra_project" "this" {
  name        = var.project_name
  description = var.project_description

  zone_assignments {
    zone_id          = data.vra_zone.this.id
    priority         = 1
    max_instances    = 5
    cpu_limit        = 16
    memory_limit_mb  = 16384
    storage_limit_gb = 1024
  }

  shared_resources        = false
  administrators          = ["olga@terasky.local"]
  members                 = ["olga@terasky.local"]
  operation_timeout       = 6000
  machine_naming_template = "$${resource.name}-$${####}"
}

resource "vra_content_sharing_policy" "this" {
  name               = var.policy_name
  description        = var.policy_description
  project_id         = vra_project.this.id

  catalog_source_ids = [
    data.catalog_source.this.id
  ]
}

output "project_id" {
  value = vra_project.this.id
}

output "content_sharing_policy_id" {
  value = vra_content_sharing_policy.this.id
}
