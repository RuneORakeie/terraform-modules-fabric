######################################
#             Provider               #
######################################
terraform {
  required_version = ">= 1.8, < 2.0"
  required_providers {
    fabric = {
      source  = "microsoft/fabric"
      version = "0.1.0-beta.6"
    }
  }
}
resource "fabric_workspace" "fab_ws" {
  display_name = var.display_name
  description  = var.description != null ? var.description : null
  capacity_id  = var.capacity_id != null ? var.capacity_id : null
  dynamic "identity" {
    for_each = var.identity_type != null ? [1] : []
    content {
      type = var.identity_type
    }
  }
}

resource "fabric_workspace_role_assignment" "precon_datasummit_ws_contributor" {
  for_each       = { for assignment in var.role_assignment_list : assignment.principal_id => assignment }
  workspace_id   = fabric_workspace.fab_ws.id
  principal_id   = each.value.principal_id
  principal_type = each.value.principal_type
  role           = each.value.role
}
