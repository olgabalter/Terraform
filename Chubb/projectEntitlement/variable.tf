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

# Input variable: project_name
variable "project_name" {
  description = "Created vRA project name"
  type = string
  default = ""
}

# Input variable: content_source
variable "content_source" {
  description = "Content source name"
  type = string
  default = ""
}
