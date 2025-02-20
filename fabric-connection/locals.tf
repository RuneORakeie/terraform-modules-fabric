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

  credentials = {
    Web = {
      credentialType = "Anonymous"
    }
    EventHub = {
      credentialType      = "SharedAccessKey"
      sharedAccessKeyName = var.eventhub_credentials.shared_access_key_name
      sharedAccessKey     = var.eventhub_credentials.shared_access_key
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
      connectionEncryption = "Encrypted"
      credentials          = local.credentials["EventHub"]
    }
  }
}
