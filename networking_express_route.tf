#
#
# Express Route Circuits
#
#

module express_route_circuits {
  source   = "./modules/networking/express_route_circuit"
  for_each = local.networking.express_route_circuits

  settings            = each.value
  resource_group_name = module.resource_groups[each.value.resource_group_key].name
  resource_groups     = module.resource_groups
  location            = lookup(each.value, "region", null) == null ? module.resource_groups[each.value.resource_group_key].location : local.global_settings.regions[each.value.region]
  diagnostics         = local.diagnostics
  global_settings     = local.global_settings
}

#
#
# Express Route Circuit Authorization
#
#

module express_route_circuit_authorizations {
  source   = "./modules/networking/express_route_circuit_authorization"
  for_each = local.networking.express_route_circuit_authorizations

  settings                   = each.value
  resource_group_name        = module.express_route_circuits[each.value.express_route_key].resource_group_name
  express_route_circuit_name = module.express_route_circuits[each.value.express_route_key].name
}

#
#
# Express Route Gateways
#
#

module express_route_circuit_gateways {
  source   = "./modules/networking/express_route_circuit_gateway"
  for_each = local.networking.express_route_circuit_gateway

  settings                   = each.value
  resource_group_name        = module.express_route_circuits[each.value.express_route_key].resource_group_name
  location                   = lookup(each.value, "region", null) == null ? module.resource_groups[each.value.resource_group_key].location : local.global_settings.regions[each.value.region]
  express_route_circuit_name = module.express_route_circuits[each.value.express_route_key].name
  virtual_hub_id             = try(module.virtual_wans[each.value.vhub.virtual_wan_key].virtual_hubs[each.value.vhub.virtual_hub_key].id, null)
}


# Outputs
output express_route_circuits {
  value       = module.express_route_circuits
  sensitive   = false
  description = "Express Route Circuit output"
}

output express_route_circuit_authorizations {
  value       = module.express_route_circuit_authorizations
  sensitive   = false
  description = "Express Route Circuit Authorizations Keys output"
}

output express_route_circuit_gateways {
  value       = module.express_route_circuit_gateways
  sensitive   = false
  description = "Express Route Circuit Gateways IDs output"
}
