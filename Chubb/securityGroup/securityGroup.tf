resource "nsxt_policy_group" "ChubbExample" {
  display_name = "ChubbExample"
  description  = "Terraform provisioned Group"
  tag {
  	scope = "location"
  	tag = "AMS"
  }
}
