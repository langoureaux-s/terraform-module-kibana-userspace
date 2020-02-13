# Create user space
resource "kibana_user_space" "user_space" {
    name              = "${local.name}"
    description       = "${var.description}"
    disabled_features = "${var.disabled_features}"
}

# Create write role
resource "kibana_role" "write" {
  name = "${local.role_write_name}"
  kibana {
    base    = ["all"]
    spaces  = ["${kibana_user_space.user_space.name}"]
  }
}

# Create read role if needed
resource "kibana_role" "read" {
  count = "${length(var.groups_read) > 0 ? 1 : 0}"
  name  = "${local.role_read_name}"
  kibana {
    base    = ["read"]
    spaces  = ["${kibana_user_space.user_space.name}"]
  }
}

# Create index pattern if needed
resource "kibana_object" "index_pattern" {
    count           = "${var.index_pattern != "" ? 1 : 0}"
    name            = "index_pattern"
    space           = "${kibana_user_space.user_space.name}"
    data            = "${var.index_pattern}"
    deep_reference  = "true"
    export_types    = ["index-pattern"]
}