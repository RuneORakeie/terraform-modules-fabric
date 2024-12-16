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
  description  = var.description
  capacity_id  = var.capacity_id
  identity {
    type = var.identity_type
  }
}

resource "fabric_workspace_role_assignment" "precon_datasummit_ws_contributor" {
  workspace_id   = fabric_workspace.fab_ws.id
  principal_id   = azuread_group.data_summit_ws_contributors.object_id
  principal_type = "Group"
  role           = "Contributor"
}
