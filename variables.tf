variable "name" {
    description = "The user space name"
}
variable "description" {
    description = "The user space description"
}
variable "disabled_features" {
  description = "List of features to disable"
  type        = list(string)
  default     = [
    "advancedSettings",
    "graph",
    "monitoring",
    "ml",
    "apm",
    "infrastructure",
    "siem",
    "uptime"
  ]
}
variable "copy_objects" {
  description = "The list of object to copy"
  type = list(object({
    id   = string
    type = string
  }))
  default = []
}
variable "source_space" {
  description = "The source user space to use when copy"
  default     = "default"
}
variable "groups_write" {
  description = "List of groups that can access on read / write"
  type        = list(string)
}
variable "groups_read" {
  description = "List of groups that can access on read only"
  type        = list(string)
  default     = []
}