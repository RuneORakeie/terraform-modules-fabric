# Create Fabric Connection
Create a Fabric connection. Supports the following connections:
* Web
* Azure Eventhub

### Resources created by module
* restapi_object.fabric_connection
* restapi_object.connection_role_assignment

#### Note!
When sourcing the module in your Terraform code note that you need a double-slash before module folder: 
```hcl
module my_fab_conn {
    source              = "github.com/RuneORakeie/terraform-modules-fabric//fabric-connection?ref=VERSION"
    ...
    ...
}
```

### Input variables
| Name | Description | Type | Default | Required |
|------|-------------|:----:|:------------:|:-----:|
|connectivity_type|Type of connectivity. The only valid value is `ShareableCloud`|string||yes|
|connection_name|Display name for the Fabric connection|string|yes|
|connection_type|Type of connection (Web or EventHub). The only valid values are `Web` and `EventHub` |string||yes|
|privacy_level|The privacy level of the connection. Valid values are `None`, `Private`, `Public`, `Organizational`.|string|`Organizational`|no|
|web_connection_url|URL for web connections. See below for example|string|null|no|
|eventhub_parameters|Parameters required for EventHub connection. See below for example||null|no|
|eventhub_credentials|Credentials for EventHub connection. See below for example||null|no|
|connection_role_assignments|A list of role assignments for the connection. See below|||no|

#### <ins>eventhub_parameters definition:</ins>
| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-------:|:-----:|
|namespace|Name of the Eventhub namespace| string ||yes|
|name|Name of the Eventhub| string ||yes|

#### <ins>eventhub_credentials definition:</ins>
| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-------:|:-----:|
|shared_access_key_name|The name given for the shared access key in Eventhub| string ||yes|
|shared_access_key|THe generated secret| string ||yes|

#### <ins>connection_role_assignment_list definition:</ins>
| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-------:|:-----:|
|principal_id|The Principal ID| string || required |
|principal_type|The type of the principal. Accepted values: `Group`, `ServicePrincipal`, `ServicePrincipalProfile`, `User`| string ||yes|
|role|The Workspace Role of the principal. Accepted values: `Owner`, `User`, `UserWithReshare`| string || yes | 

#### Example - role_assignment_list
```hcl
module my_fab_conn {
    source               = "github.com/RuneORakeie/terraform-modules-fabric//fabric-connection?ref=VERSION"
    connection_name         = ...
    ...
    ...
    connection_role_assignment_list = [
        {
            principal_id   = data.azuread.contributor_group.object_id
            principal_type = "Group"
            role           = "Owner"
        },
        {
            principal_id   = data.azuread.viewer_group.object_id
            principal_type = "User"
            role           = "UserWithReshare"
        },
    ] 
}
```

### Example 1. Create Web connection without role assignment 
```hcl
module "test_module" {
  source               = "github.com/RuneORakeie/terraform-modules-fabric//fabric-connection?ref=VERSION"
  connection_name    = "Web-Conn-AirBnB"
  connection_type    = "Web"
  connectivity_type  = "ShareableCloud"
  privacy_level      = "Public"
  web-connection_url = "https://data.insideairbnb.com/"
}
```
### Example 2. Create Eventhub connection with role assignments
```hcl
module "test_module" {
  source               = "github.com/RuneORakeie/terraform-modules-fabric//fabric-connection?ref=VERSION"
  connection_name = "MyEventHub-conn"
  connection_type = "EventHub"

  connectivity_type = "ShareableCloud"
  privacy_level     = "None" # Optional, defaults to "Organizational"

  eventhub_parameters = {
    namespace = "my-ehub-namespace"
    name      = "my-ehub"
  }
  eventhub_credentials = {
    shared_access_key_name = "MyFabricKey"
    shared_access_key      = var.azeventhub_saskey
  }
  connection_role_assignments = [
    {
      principal_id   = data.azuread_group.fabric_ws_contributors.object_id
      principal_type = "Group"
      role           = "Owner"
    },
    {
      principal_id   = data.azuread_user.admin.object_id
      principal_type = "User"
      role           = "Owner"
    },

  ]
}
```
### Outputs

| Name | Description |
|------|-------------|
| id | The Connection ID |
