Terraform Azure Data Disks
==========================

Module to assign a dynamic number of managed data disks to Azure
virtual machines. This is a workaround until the following
Terraform core issue is resolved https://github.com/hashicorp/terraform/issues/7034

## Dependencies ##

* Azure CLI must be installed and logged in to the correct subscription

## Example ##

This will assign a 10GB Standard_LRS, 20GB Standard_LRS and 30GB Premium_LRS
managed disk to myvm-00, myvm-01 and myvm-02

```
module "terraform-azure_data_disks" {
  source              = "git::https://github.com/hiscox/terraform-azure_data_disks.git"
  resource_group_name = "resource_group"
  vm_count            = 3
  disk_count          = 3

  vm_names = [
    "myvm-00",
    "myvm-01",
    "myvm-02",
  ]

  disk_sizes = [
    10,
    20,
    30,
  ]

  disk_skus = [
    "Standard_LRS",
    "Standard_LRS",
    "Premium_LRS",
  ]

  disk_caching = [
    "ReadOnly",
    "ReadOnly",
    "None",
  ]
}
```