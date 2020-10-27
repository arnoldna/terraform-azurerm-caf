

resource_groups = {
  sig = {
    name = "sig"
  }
  sig2 = {
    name = "sig2"
  }
}

shared_image_gallery = {

  galleries = {
    gallery1 ={
      name = "test1"
      resource_group_key = "sig"
      description = " "
    }
    gallery2 = {
      name = "test2"
      resource_group_key = "sig2"
      description = " "
    }
  }

  image_definition = {
    image1 = {
      name = "image1"
      gallery_key = "gallery1"
      resource_group_key = "sig"
      os_type = "Linux"
      publisher = "MyCompany"
      offer     = "WebServer"
      sku       = "2020.1"
  
    }
  }

}

packer = {
  use_packer = true
  packer_file_path = "/tf/caf/modules/shared_image_gallery/packer/image_builder_from_marketplace.pkr.hcl"
  packer_configuration_file_path = "/tf/caf/public/landingzones/caf_shared_services/scenario/110-shared-image-gallery/packer_config.pkvars.hcl"

}
