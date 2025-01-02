data "vra_project" "this" {
  name = var.project_name
}

resource "vra_catalog_source_blueprint" "this" {
  name       = var.content_source
  project_id = data.vra_project.this.id
}

