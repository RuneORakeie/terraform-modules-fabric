variable "debug" {
  type        = bool
  default     = false
  description = "Enable debug output"
}
variable "connectivity_type" {
  type        = string
  description = "Type of connectivity"
  validation {
    condition     = contains(["ShareableCloud"], var.connectivity_type)
    error_message = "Connection type must be 'ShareableCloud'"
  }
}
variable "connection_name" {
  type        = string
  description = "Display name for the Fabric connection"
}

variable "connection_type" {
  type        = string
  description = "Type of connection (Web or EventHub)"
  validation {
    condition     = contains(["Web", "EventHub"], var.connection_type)
    error_message = "Connection type must be either 'Web' or 'EventHub'"
  }
}

variable "web_connection_url" {
  type        = string
  default     = null
  description = "URL for web connections"
}

variable "eventhub_parameters" {
  type = object({
    namespace = string
    name      = string
  })
  default     = null
  description = "Parameters required for EventHub connection"
}

variable "eventhub_credentials" {
  type = object({
    shared_access_key_name = string
    shared_access_key      = string
  })
  default     = null
  description = "Credentials for EventHub connection"
  sensitive   = true
  ephemeral   = true
}
variable "privacy_level" {
  type        = string
  description = "The privacy level of the connection"
  default     = "Organizational"
  validation {
    condition     = contains(["None", "Private", "Public", "Organizational"], var.privacy_level)
    error_message = "Privacy level must be one of: None, Private, Public, Organizational"
  }
}
variable "connection_role_assignments" {
  description = "A list of role assignments for the connection"
  type = list(object({
    principal_id   = string
    principal_type = string
    role           = string
  }))
  default = []

  validation {
    condition = alltrue([
      for assignment in var.connection_role_assignments :
      can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", assignment.principal_id))
    ])
    error_message = "Principal ID must be a valid UUID format."
  }

  validation {
    condition = alltrue([
      for assignment in var.connection_role_assignments :
      contains(["User", "Group", "ServicePrincipal", "ServicePrincipalProfile"], assignment.principal_type)
    ])
    error_message = "Principal type must be one of: User, Group, ServicePrincipal, ServicePrincipalProfile."
  }

  validation {
    condition = alltrue([
      for assignment in var.connection_role_assignments :
      contains(["Owner"], assignment.role) # Adjust allowed roles based on your needs
    ])
    error_message = "Role must be: Owner"
  }

  validation {
    condition = length(distinct([
      for assignment in var.connection_role_assignments :
      "${assignment.principal_id}-${assignment.role}"
    ])) == length(var.connection_role_assignments)
    error_message = "Duplicate role assignments for the same principal are not allowed."
  }
}
