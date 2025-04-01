######################################
#             Provider               #
######################################
terraform {
  required_version = ">= 1.8, < 2.0"
  required_providers {
    fabric = {
      source  = "microsoft/fabric"
      version = "~> 1"
    }
  }
}

resource "fabric_workspace" "fab_ws" {
  display_name = var.display_name
  description  = var.description != null ? var.description : null
  capacity_id  = var.capacity_id != null ? var.capacity_id : null
  identity     = var.identity_type != null ? { type = var.identity_type } : null
}

resource "fabric_workspace_role_assignment" "fab_ws_role_assign" {
  for_each     = { for idx, assignment in var.role_assignment_list : tostring(idx) => assignment }
  workspace_id = fabric_workspace.fab_ws.id
  role         = each.value.role
  principal = {
    id   = each.value.principal_id
    type = each.value.principal_type
  }
}
