locals {
    name            = "${replace(var.name), "/[ \\-]/", "_"}"
    role_write_name = "space_${local.name}_write"
    role_read_name  = "space_${local.name}_read"
    groups_write    = "{\"any\":[${replace(formatlist("{\"field\":{\"groups\":\"%s\"}},", var.groups_write), "/,$/", "")}]}"
    groups_read     = "{\"any\":[${replace(formatlist("{\"field\":{\"groups\":\"%s\"}},", var.groups_read), "/,$/", "")}]}"
}