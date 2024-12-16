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
