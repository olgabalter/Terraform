data "vra_project" "this" {
  name = var.project_name
}

data "catalog_source" "this" {
  name = var.content_source
}

resource "vra_content_sharing_policy" "this" {
  name               = var.policy_name
  description        = var.policy_description
  project_id         = data.vra_project.this.id

  catalog_source_ids = [
    data.catalog_source.this.id
  ]
}
