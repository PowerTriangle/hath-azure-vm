terraform {
    required_version = "~>1.3"
    required_providers {
        azurerm = {
            source  = "hashicorp/azurerm"
            version = "~>2.0"
        }
        template = {
            source  = "hashicorp/template"
            version = "~>2.2"
        }
        random = {
            source  = "hashicorp/random"
            version = "~>2.2"
        }
    }
}