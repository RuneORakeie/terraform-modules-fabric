###########################
## Connection Parameters ##
###########################
locals {
  connection_parameters = {
    Web = [
      {
        dataType = "Text"
        name     = "url"
        value    = var.web_connection_url
      }
    ]
    EventHub = [
      {
        dataType = "Text"
        name     = "eventHubNamespace"
        value    = var.eventhub_parameters.namespace
      },
      {
        dataType = "Text"
        name     = "eventHubName"
        value    = var.eventhub_parameters.name
      }
    ]
  }

  connection_details = {
    Web = {
      type           = var.connection_type
      creationMethod = var.connection_type
      parameters     = local.connection_parameters["Web"]
    }
    EventHub = {
      type       = var.connection_type
      parameters = local.connection_parameters["EventHub"]
    }
  }

  credentials = {
    Web = {
      credentialType = "Anonymous"
    }
    EventHub = {
      credentialType      = "SharedAccessSignature"
      sharedAccessKeyName = var.eventhub_credentials.shared_access_key_name
      token               = var.eventhub_credentials.shared_access_key
    }
  }
}
##########################
##  Credential Details  ##
##########################
locals {
  credential_details = {
    Web = {
      singleSignOnType     = "None"
      connectionEncryption = "NotEncrypted"
      skipTestConnection   = true
      credentials          = local.credentials["Web"]
    }
    EventHub = {
      singleSignOnType     = "None"
      connectionEncryption = "Encrypted"
      skipTestConnection   = false
      credentials          = local.credentials["EventHub"]
    }
  }
}
