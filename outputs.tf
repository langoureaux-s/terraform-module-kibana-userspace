locals {
  role_read_id    = "${compact(concat(coalescelist(kibana_role.read.*.id), list("")))}"
  role_read_name  = "${compact(concat(coalescelist(kibana_role.read.*.name), list("")))}"
}


output "space_id" {
  value = "${kibana_user_space.user_space.id}"
}

output "space_name" {
  value = "${kibana_user_space.user_space.name}"
}

output "role_write_id" {
  value = "${kibana_role.write.id}"
}

output "role_write_name" {
  value = "${kibana_role.write.name}"
}

output "role_read_id" {
  value = "${join("", local.role_read_id)}"
}

output "role_read_name" {
  value = "${join("", local.role_read_name)}"
}