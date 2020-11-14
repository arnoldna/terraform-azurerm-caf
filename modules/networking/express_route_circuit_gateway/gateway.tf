resource "azurerm_express_route_circuit_gateway" "gateway" {
  name                       = var.settings.name
  express_route_circuit_name = var.express_route_circuit_name
  resource_group_name        = var.resource_group_name
  location                   = var.location
  tags                       = local.tags
  virtual_hub_id             = azurerm_virtual_hub.example.id
  scale_units                = try(var.settings.scale_units, 1)
}
