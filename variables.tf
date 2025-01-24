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

variable "name" {
  description = "The name of the storage container."
  type        = string
}

variable "storage_account_name" {
  description = "The name of the storage account."
  type        = string
  default     = null
}

variable "container_access_type" {
  description = "The access type of the storage container."
  type        = string
  default     = null
}

variable "default_encryption_scope" {
  description = "The default encryption scope for the storage container."
  type        = string
  default     = null
}

variable "encryption_scope_override_enabled" {
  description = "Specifies if encryption scope override is enabled."
  type        = bool
  default     = null
}

variable "metadata" {
  description = "A mapping of metadata to assign to the storage container."
  type        = map(string)
  default     = null
}
