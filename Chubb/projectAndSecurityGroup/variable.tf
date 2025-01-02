
# Input variable: url
variable "url" {
  description = "The URL of the vRealize Automation environment either vRA 8.x or vRA Cloud"
  type = string
  default = "https://ca-vra.terasky.local"
}

# Input variable: access_token
variable "access_token" {
  description = "The access token to connect to the vRealize Automation environment"
  type = string
  default = ""
}

# Input variable: refresh_token
#variable "refresh_token" {
#  description = "The refresh token to connect to the vRealize Automation environment"
#  type = string
#  default = ""
#}

# Input variable: insecure
variable "insecure" {
  description = "Should SSL verification be skipped? true = skip ssl verification"
  type = bool
  default = "true"
}
# Input variable: project_name
variable "project_name" {
  description = "vRA Project Name to be added to the project"
  type = string
  default = ""
}

# Input variable: project_description
variable "project_description" {
  description = "vRA Project Description to be added to the project"
  type = string
  default = ""
}

# Input variable: zone_name
variable "zone_name" {
  description = "vRA Zone Name to be added to the project"
  type = string
  default = ""
}
# Input variable: content_source
variable "content_source" {
  description = "Content source name"
  type = string
  default = ""
}

# Input variable: policy_name
variable "policy_name" {
  description = "Content sharing policy name"
  type = string
  default = ""
}

# Input variable: poilcy_description
variable "poilcy_description" {
  description = "Content sharing policy description"
  type = string
  default = ""
}

# Input variable: location
variable "location" {
  description = "Project location"
  type = string
  default = ""
}

# Input variable: env
variable "env" {
  description = "Project environment"
  type = string
  default = ""
}

# Input variable: app
variable "app" {
  description = "Project application"
  type = string
  default = ""
}
