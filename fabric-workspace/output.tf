output "id" {
  description = "The Workspace ID"
  value       = fabric_workspace.fab_ws.id
}
output "display_name" {
  description = "The Workspace display name"
  value       = fabric_workspace.fab_ws.display_name
}
output "description" {
  description = "The Workspace description"
  value       = fabric_workspace.fab_ws.description
}
output "capacity_id" {
  description = "The ID of the Fabric Capacity assigned to the Workspace"
  value       = fabric_workspace.fab_ws.capacity_id
}
output "identity_type" {
  description = "The identity type of the Workspace"
  value       = fabric_workspace.fab_ws.identity.type
}
output "identity_application_id" {
  description = "The identity application_id of the Workspace"
  value       = fabric_workspace.fab_ws.identity.application_id
}
output "identity_service_principal_id" {
  description = "The identity service principal_id of the Workspace"
  value       = fabric_workspace.fab_ws.identity.service_principal_id
}
output "onelake_blob_endpoint" {
  description = "The OneLake Blob endpoint of the Workspace"
  value       = fabric_workspace.fab_ws.onelake_endpoints.blob_endpoint
}
output "onelake_dfs_endpoint" {
  description = "The OneLake DFS endpoint of the Workspace"
  value       = fabric_workspace.fab_ws.onelake_endpoints.dfs_endpoint
}
output "capacity_assignment_progress" {
  description = "A Workspace assignment to capacity progress status"
  value       = fabric_workspace.fab_ws.capacity_assignment_progress

}
output "capacity_region" {
  description = "The region of the capacity associated with this workspace"
  value       = fabric_workspace.fab_ws.capacity_region

}
output "type" {
  description = "The Workspace type"
  value       = fabric_workspace.fab_ws.type

}
output "role_assignment_list" {
  description = "The list of role assignments definitions created for the Workspace"
  value       = fabric_workspace_role_assignment.fab_ws_role_assign
}


