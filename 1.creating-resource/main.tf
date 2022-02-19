provider "azurerm"{
    version = "1.38"

}

resource "azurerm_resource_group" "rg" {
    name = "TFResourceGroup"
    location= "eastus"
    tags={

        environment="Terraform"
        CreatedBy= "admin"
}
}