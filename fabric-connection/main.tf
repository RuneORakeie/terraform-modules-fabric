
######################################
#             Provider               #
######################################
terraform {
  required_version = ">= 1.8, < 2.0"
  required_providers {
    ## Microsoft Fabric REST API 
    restapi = {
      source = "mastercard/restapi"
    }
  }
}
# Create connection resource
resource "restapi_object" "fabric_connection" {
  path = "/connections"
  data = jsonencode({
    "connectivityType" : var.connectivity_type,
    "displayName" : var.connection_name,
    "connectionDetails" : {
      "type" : var.connection_type,
      "creationMethod" : var.connection_type,
      "parameters" : local.connection_parameters[var.connection_type]
    },
    "privacyLevel" : var.privacy_level,
    "credentialDetails" : local.credential_details[var.connection_type]
  })

  read_path     = "/connections/{id}"
  update_path   = "/connections/{id}"
  update_method = "PATCH"
  destroy_path  = "/connections/{id}"

  debug = true # Enable for troubleshooting
}

# Create role assignment
resource "restapi_object" "connection_role_assignment" {
  for_each = {
    for idx, assignment in var.connection_role_assignments : tostring(idx) => assignment
  }

  path = "/connections/${restapi_object.fabric_connection.id}/roleAssignments"
  data = jsonencode({
    "principal" : {
      "id" : each.value.principal_id,
      "type" : each.value.principal_type
    },
    "role" : each.value.role
  })

  # These are required even for POST operations
  read_path    = "/connections/${restapi_object.fabric_connection.id}/roleAssignments/{id}"
  update_path  = "/connections/${restapi_object.fabric_connection.id}/roleAssignments/{id}"
  destroy_path = "/connections/${restapi_object.fabric_connection.id}/roleAssignments/{id}"
}
