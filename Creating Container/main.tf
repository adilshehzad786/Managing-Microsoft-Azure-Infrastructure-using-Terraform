provider "azurerm"{
    version= 1.38
}

terraform{
    backend "azurerm"{

        resource_group_name  = "cloud-shell-storage-centralindia"
        storage_account_name = "csg10032000c44a6007"
        container_name       = "terraform"
        key                  = "terraform.tfstate"
    }
}