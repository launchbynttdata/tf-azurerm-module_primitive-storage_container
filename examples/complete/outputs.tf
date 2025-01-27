// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

output "storage_account_id" {
  description = "The ID of the storage account."
  value       = module.storage_account.id
}

output "storage_account_name" {
  description = "Name of the storage account."
  value       = local.storage_account_name
}

output "resource_group_name" {
  description = "The name of the resource group in which the storage account is created."
  value       = module.resource_group.name
}

output "container_id" {
  value       = module.storage_container.id
  description = "id of the storage container"
}

output "container_name" {
  value       = module.storage_container.name
  description = "name of the storage container"
}
