output express_route_circuits {
  value       = module.caf.express_route_circuits
  sensitive   = false
  description = "Express Route Circuit output"
}

output express_route_circuit_authorizations {
  value       = module.caf.express_route_circuit_authorizations
  sensitive   = false
  description = "Express Route Circuit Authorizations Keys output"
}

output express_route_circuit_gateways {
  value       = module.caf.express_route_circuit_gateways
  sensitive   = false
  description = "Express Route Circuit Gateways Keys output"
}
