locals {
  final_count = "${var.disk_count == 0 ? 0 : "${var.vm_count}"}"
}
