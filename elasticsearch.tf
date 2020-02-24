# Create role mapping for write
resource elasticsearch_role_mapping "write" {
    name    = local.role_write_name
    enabled = "true"
    roles   = ["${kibana_role.write.name}"]
    rules   = local.groups_write
}

# Create role mapping for read if needed
resource elasticsearch_role_mapping "read" {
    count   = "${length(var.groups_read) > 0 ? 1 : 0}"
    name    = local.role_read_name
    enabled = "true"
    roles   = ["${kibana_role.read[count.index].name}"]
    rules   = local.groups_read
}