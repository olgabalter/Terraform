data "vra_zone" "this" {
  name = var.zone_name
}

data "vra_catalog_source_blueprint" "this" {
  name = var.content_source
}

# List of scopes for each tag
locals {
  tag_scopes = ["region", "location", "environment", "app_type"]
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
  administrator_roles {
    email = var.requestor
    type  = "user"
  }
  
  member_roles {
    email = var.requestor
    type  = "user"
  }
  
  operation_timeout       = 6000
  machine_naming_template = "$${resource.name}-$${####}"
  custom_properties = {
    for i, v in var.environment_config: "prop${i + 1}" => v
  }
}

resource "vra_content_sharing_policy" "this" {
  name               = var.policy_name
  description        = var.poilcy_description
  project_id         = vra_project.this.id
  catalog_source_ids = [
    data.vra_catalog_source_blueprint.this.id
  ]
}

resource "nsxt_policy_group" "this" {
  for_each =  toset(var.environment_config)
  display_name = "${var.project_name}-${each.value}"
  description  = "Policy group for ${each.value}"

  criteria {
    dynamic "condition" {
      for_each = split("-",each.value)
      content {
        key         = "Tag"
        scope       = local.tag_scopes[index(split("-", each.value), tag.value)]
        member_type = "VirtualMachine"
        operator    = "EQUALS"
        value       = tag.value
        }
     }
   }

    conjunction {
    operator = "AND"
    }

  dynamic "tag" {
    for_each = split("-",each.value)
    content {
      scope = local.tag_scopes[index(split("-", each.value), tag.value)]
      tag = tag.value
    }
  }
}
