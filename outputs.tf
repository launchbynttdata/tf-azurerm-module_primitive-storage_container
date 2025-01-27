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

output "id" {
  description = "The ID of the storage container."
  value       = azurerm_storage_container.container.id
}

output "name" {
  description = "The name of the storage container."
  value       = azurerm_storage_container.container.name
}

output "access_type" {
  description = "The access type of the storage container."
  value       = azurerm_storage_container.container.container_access_type
}

output "metadata" {
  description = "The metadata of the storage container."
  value       = azurerm_storage_container.container.metadata
}

output "has_immutability_policy" {
  description = "Indicates if the storage container has an immutability policy."
  value       = azurerm_storage_container.container.has_immutability_policy
}

output "has_legal_hold" {
  description = "Indicates if the storage container has a legal hold."
  value       = azurerm_storage_container.container.has_legal_hold
}

output "resource_manager_id" {
  description = "The resource manager ID of the storage container."
  value       = azurerm_storage_container.container.resource_manager_id
}
