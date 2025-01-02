data "vra_zone" "this" {
  name = var.zone_name
}

data "vra_catalog_source_blueprint" "this" {
  name = var.content_source
}

resource "vra_project" "this" {
  name        = var.project_name
  description = var.project_description
  zone_assignments {
    zone_id          = data.vra_zone.this.id
    priority         = 0
    max_instances    = 0
    cpu_limit        = 0
    memory_limit_mb  = 0
    storage_limit_gb = 0
  }

  shared_resources    = false
  administrators          = ["olga@terasky.com"]
  members                 = ["olga@terasky.com"]
  operation_timeout       = 6000
  machine_naming_template = "$${resource.name}-$${####}"
  constraints {
    extensibility {
      expression = "application:web"
      mandatory  = true
    }
    extensibility {
      expression = "environment:Test"
      mandatory  = true
    }
  }
}

resource "vra_catalog_source_entitlement" "this" {
  catalog_source_id = data.vra_catalog_source_blueprint.this.id
  project_id        = vra_project.this.id
}



