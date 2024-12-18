variable "display_name" {
  description = "The Workspace display name."
  type        = string
}
variable "capacity_id" {
  description = "The ID of the Fabric Capacity to assign to the Workspace."
  type        = string
}
variable "description" {
  description = "The Workspace description."
  type        = string
}
variable "identity_type" {
  description = "The identity type of the Workspace. The default value is SystemAssigned"
  type        = string
}

variable "role_assignment_list" {
  description = "A list of role assignments definitions to create for the Workspace."
  type = list(object({
    principal_id   = string
    principal_type = string
    role           = string
  }))
  validation {
    condition = alltrue([
      for assignment in var.role_assignment_list :
      can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", assignment.principal_id))
    ])
    error_message = "Principal ID must be a valid UUID format."
  }
  validation {
    condition = alltrue([
      for assignment in var.role_assignment_list :
      contains(["Group", "ServicePrincipal", "ServicePrincipalProfile", "User"], assignment.principal_type)
    ])
    error_message = "Principal type must be one of: Group, ServicePrincipal, ServicePrincipalProfile, User."
  }
  validation {
    condition = alltrue([
      for assignment in var.role_assignment_list :
      contains(["Admin", "Contributor", "Member", "Viewer"], assignment.role)
    ])
    error_message = "Role must be one of: Admin, Contributor, Member, Viewer."
  }
  validation {
    condition = length(distinct([for assignment in var.role_assignment_list :
    "${assignment.principal_id}-${assignment.role}"])) == length(var.role_assignment_list)
    error_message = "Duplicate role assignments for the same principal are not allowed."
  }
}
