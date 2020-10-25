source "azure-arm" "packer-exec" {
  subscription_id = var.subscription
  client_id = var.client_id
  client_secret = var.client_secret
  tenant_id = var.tenant_id
  os_type = var.os_type
  location = var.location
  vm_size = var.vm_size

  shared_image_gallery {
    subscription = var.source_subscription
    resource_group = var.source_sig_resource_group
    gallery_name = var.source_gallery_name
    image_name = var.source_image_name
    image_version = var.source_image_version
    }

  shared_image_gallery_destination {
    subscription = var.subscription
    resource_group = var.resource_group_name
    gallery_name = var.gallery_name
    image_name = var.image_name
    image_version = var.image_version
    replication_regions = var.replication_regions
  }
  managed_image_name = var.managed_image_name
  managed_image_resource_group_name = var.managed_image_resource_group_name

}

build {
    sources = [
        "source.azure-arm.packer-exec"
    ]
    provisioner "ansible" {
      playbook_file = "${var.playbook_path}"
    }
}

variable "os_type" {}
variable "image_publisher" {}
variable "image_offer" {}
variable "image_sku" {}
variable "location" {
  default ="southeastasia"
}
variable "vm_size" {
  default ="Standard_A2"
}
variable "playbook_path" {}
variable subscription {}
variable gallery_name {}
variable image_name {}
variable image_version {}
variable client_id {}
variable client_secret {}
variable tenant_id {}
variable replication_regions {}
variable managed_image_name {}
variable managed_image_resource_group_name {}
variable resource_group_name {}
variable source_subscription {}
variable source_sig_resource_group {}
variable source_gallery_name {}
variable source_image_name {}
variable source_image_version {}