# terraform-module-kibana-userspace

This module permit to deploy userspace on Kibana / elasticsearch

```
terragrunt = {
  terraform {
    source = "git::https://github.com/langoureaux-s/terraform-module-kibana-userspace.git"
  }
  
  name         = "team_a"
  description  = "Space dedicated to team A"
  groups_write = [
    "CN=team_a,OU=Groups,DC=DOMAIN,DC=COM"
  ]
}
```
> You need to initialized kibana and elasticsearch provider on main terraform code
> Don't forget to read the file `variables.tf` to get all informations about variables.