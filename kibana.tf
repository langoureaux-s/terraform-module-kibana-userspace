# Create user space
resource "kibana_user_space" "user_space" {
    name              = local.name
    description       = var.description
    disabled_features = var.disabled_features
}

# Create write role
resource "kibana_role" "write" {
  name = local.role_write_name
  kibana {
    base    = ["all"]
    spaces  = ["${kibana_user_space.user_space.name}"]
  }
}

# Create read role if needed
resource "kibana_role" "read" {
  count = length(var.groups_read) > 0 ? 1 : 0
  name  = local.role_read_name
  kibana {
    base    = ["read"]
    spaces  = ["${kibana_user_space.user_space.name}"]
  }
}

# Copy object if needed
resource kibana_copy_object "test" {
  for_each      = {for object in var.copy_objects: object.id => object}
  name          = "copy_object"
  source_space  = var.source_space
  target_spaces = ["${kibana_user_space.user_space.name}"]
  object {
    id   = each.value.id
    type = each.value.type
  }
  force_update = true
}
