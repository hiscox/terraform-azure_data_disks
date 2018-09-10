data "null_data_source" "disks" {
  # count = "${length(var.disk_sizes)}"
  count = "${var.disk_count}"

  inputs = {
    command   = "az vm disk attach -g ${var.resource_group_name} --new --size-gb ${element(var.disk_sizes, count.index)}"
    disk_name = "-data-${count.index}"
    lun       = "--lun ${count.index}"
    sku       = "--sku ${element(var.disk_skus, count.index)}"
    cache     = "--caching ${element(var.disk_caching, count.index)}"
  }
}

resource "null_resource" "disks" {
  # count = "${length(var.vm_names)}"
  count = "${local.final_count}"

  provisioner "local-exec" {
    command = "${join(" && ",
      formatlist("%s --vm-name ${element(var.vm_names, count.index)} --disk ${element(var.vm_names, count.index)}%s %s %s %s",
        "${data.null_data_source.disks.*.outputs.command}",
        "${data.null_data_source.disks.*.outputs.disk_name}",
        "${data.null_data_source.disks.*.outputs.lun}",
        "${data.null_data_source.disks.*.outputs.sku}",
        "${data.null_data_source.disks.*.outputs.cache}"
      )
    )}"
  }
}
