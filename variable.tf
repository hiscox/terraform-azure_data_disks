variable "resource_group_name" {}

variable "vm_names" {
  type        = "list"
  description = "List of VM names to assign disks to. All VMs will get the same disks"
}

# It is necessary to specify these rather than just using the length
# of the vm_names and disk_sizes variables because count values can't
# currently be computed
variable "vm_count" {
  default = 0
}

variable "disk_count" {
  default = 0
}

variable "disk_sizes" {
  type        = "list"
  description = "List of disk sizes in GB. A disk will be created for each item in the list"
  default     = []
}

variable "disk_skus" {
  type        = "list"
  description = "List of SKUs (Standard_LRS or Premium_LRS). Pass in an entry for each element in disk_sizes and in the same order"
  default     = []
}

variable "disk_caching" {
  type        = "list"
  description = "List of caching options (None, ReadOnly, ReadWrite). Pass in an entry for each element in disk_sizes and in the same order"
  default     = []
}
