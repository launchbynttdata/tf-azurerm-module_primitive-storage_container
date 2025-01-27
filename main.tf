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

resource "azurerm_storage_container" "container" {
  name                              = var.name
  storage_account_name              = var.storage_account_name
  container_access_type             = var.container_access_type
  default_encryption_scope          = var.default_encryption_scope
  encryption_scope_override_enabled = var.encryption_scope_override_enabled
  metadata                          = var.metadata
}
