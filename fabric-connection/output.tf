output "id" {
  description = "The Connection ID"
  value       = restapi_object.fabric_connection.id
}

output "api_response" {
  description = "The raw body of the HTTP response from the last read of the object (only shown when debug = true)"
  value       = var.debug ? restapi_object.fabric_connection.api_response : null
}

output "api_data" {
  description = "After data from the API server is read, this map will include k/v pairs usable in other terraform resources as readable objects. Currently the value is the golang fmt package's representation of the value (simple primitives are set as expected, but complex types like arrays and maps contain golang formatting) (only shown when debug = true)"
  value       = var.debug ? restapi_object.fabric_connection.api_data : null
}

output "create_response" {
  description = "The raw body of the HTTP response returned when creating the object (only shown when debug = true)"
  value       = var.debug ? restapi_object.fabric_connection.create_data : null
}


