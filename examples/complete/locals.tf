locals {
  storage_account_name   = module.resource_names["storage_account"].minimal_random_suffix_without_any_separators
  resource_group_name    = module.resource_names["resource_group"].minimal_random_suffix
  storage_container_name = module.resource_names["storage_container"].minimal_random_suffix
}
