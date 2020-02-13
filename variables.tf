variable "name" {
    description = "The user space name"
}
variable "description" {
    description = "The user space description"
}
variable "disabled_features" {
  description = "List of features to disable"
  type        = "list"
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
variable "index_pattern" {
  description = "Index pattern saved object to import"
  default = ""
}
variable "groups_write" {
  description = "List of groups that can access on read / write"
  type        = "list"
}
variable "groups_read" {
  description = "List of groups that can access on read only"
  type        = "list"
  default     = []
}