resource "nsxt_policy_group" "ChubbExample" {
  display_name = "ChubbExample"
  description  = "Terraform provisioned Group"
  criteria {
    operator = "OR"
    expression {
      resource_type = "Condition"
      key           = "Tag"
      operator      = "EQUALS"
      value         = "environment:production"
    }
  }
}
