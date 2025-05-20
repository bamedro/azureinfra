resource "azurerm_resource_group" "this" {
    name = "tfexample-rg"
    location = "francecentral"
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.29.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "537bb5af-974a-40ed-9493-5761b69e345a"
}

terraform {
  backend "azurerm" {
    use_msi              = true                                    # Can also be set via `ARM_USE_MSI` environment variable.
    use_azuread_auth     = true                                    # Can also be set via `ARM_USE_AZUREAD` environment variable.
    #tenant_id            = "1839131b-b8dd-444e-8f2f-edf1ecebfbe9"  # Can also be set via `ARM_TENANT_ID` environment variable.
    #client_id            = "00000000-0000-0000-0000-000000000000"  # Can also be set via `ARM_CLIENT_ID` environment variable. Not required for System Assigned Managed Identity.
    storage_account_name = "tflabssparksbypnl4eu2u4h"                              # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "tfstates"                               # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "prod.terraform.tfstate"                # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  }
}