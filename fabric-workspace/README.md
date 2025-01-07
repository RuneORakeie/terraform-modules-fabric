# Create Fabric Workspace
Create a Fabric workspace and assign role for a specific type of principal.

### Resources created by module
* fabric_workspace.fab_ws
* fabric_workspace_role_assignment.fab_ws_role_assign

#### Note!
When sourcing the module in your Terraform code note that you need a double-slash before module folder: 
```hcl
module my_fab_ws {
    source              = "github.com/RuneORakeie/terraform-modules-fabric//fabric-workspace?ref=VERSION"
    ...
    ...
}
```

### Input variables
| Name | Description | Type | Default | Required |
|------|-------------|:----:|:------------:|:-----:|
|capacity_id|The ID of the Fabric Capacity to assign to the Workspace|string||no|
|description|The Workspace description|string||no|
|identity_type|The identity type of the Workspace. The only valid value is `SystemAssigned`|string||yes|
|role_assignment_list|A list of role assignments definitions to create for the Workspace. See below||no|

#### <ins>role_assignment_list definition:</ins>
| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-------:|:-----:|
|principal_id|The Principal ID| string || required |
|principal_type|The type of the principal. Accepted values: `Group`, `ServicePrincipal`, `ServicePrincipalProfile`, `User`| string ||yes|
|role|The Workspace Role of the principal. Accepted values: `Admin`, `Contributor`, `Member`, `Viewer`| string || yes | 

#### Example - role_assignment_list
```hcl
module my_fab_ws {
    source               = "github.com/RuneORakeie/terraform-modules-fabric//fabric-workspace?ref=VERSION"
    display_name         = ...
    ...
    ...
    role_assignment_list = [
        {
            principal_id   = data.azuread.contributor_group.object_id
            principal_type = "Group"
            role           = "Contributor"
        },
        {
            principal_id   = data.azuread.viewer_group.object_id
            principal_type = "Group"
            role           = "Viewer"
        },
    ] 
}
```

### Example 1. Create workspace without role assignment 
```hcl
module "test_module" {
  source               = "github.com/RuneORakeie/terraform-modules-fabric//fabric-workspace?ref=VERSION"
  display_name         = "Test workspace"
  capacity_id          = data.fabric_capacity.capacity.id
}
```
### Example 2. Create User with role assignments and workspace identity
```hcl
module "test_module" {
  source               = "github.com/RuneORakeie/terraform-modules-fabric//fabric-workspace?ref=VERSION"
  display_name         = "Test workspace"
  description          = "My test workspace"
  capacity_id          = data.fabric_capacity.capacity.id
  identity_type        = "SystemAssigned"
  role_assignment_list = [
    {
        principal_id   = data.azuread.contributor_group.object_id
        principal_type = "Group"
        role           = "Contributor"
    },
    {
        principal_id   = data.azuread.viewer_group.object_id
        principal_type = "Group"
        role           = "Viewer"
    },
  ]
}
```
### Outputs

| Name | Description |
|------|-------------|
| id | "The Workspace ID |
| display_name | The Workspace display name |
| description | The Workspace description |
| capacity_id | The ID of the Fabric Capacity assigned to the Workspace |
| identity_type | The identity type of the Workspace |
| identity_application_id | The identity application_id of the Workspace |
| identity_service_principal_id | The identity service principal_id of the Workspace |
| onelake_blob_endpoint | The OneLake Blob endpoint of the Workspace |
| onelake_dfs_endpoint | The OneLake DFS endpoint of the Workspace |
| capacity_assignment_progress | A Workspace assignment to capacity progress status |
| capacity_region | The region of the capacity associated with this workspace |
| type | The Workspace type |
| role_assignment_list | The list of role assignments definitions created for the Workspace |
