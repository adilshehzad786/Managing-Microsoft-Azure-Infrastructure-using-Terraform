provider "azurerm" {
    version = 1.38
  
}

resource "azurerm_virtual_network" "TFNet" {

    name          = "myVnet"
    address_space = ["10.0.0.0/16"]
    location      = "eastus"
    resource_group_name = "TFResourceGroup"  
    tags={

        environment = "Terraform"
    } 
}

resource "azurerm_subnet" "tfsubnet" {

    name = "mySubnet"
    resource_group_name = "TFResourceGroup"
    virtual_network_name = azurerm_virtual_network.TFNet.name
    address_prefix = "10.0.1.0/24"

}

resource "azurerm_subnet" "tfsubnet2" {

    name = "mySubnet2"
    resource_group_name = "TFResourceGroup"
    virtual_network_name = azurerm_virtual_network.TFNet.name
    address_prefix = "10.0.2.0/24"

}

resource "azurerm_network_security_group" "nsg" {
  name                = "acceptanceTestSecurityGroup1"
  location            = azurerm_virtual_network.TFNet.location
  resource_group_name = azurerm_virtual_network.TFNet.resource_group_name
}

resource "azurerm_network_security_rule" "example1" {

  name= "Web80"
  priority = 1000
  direction = "Inbound"
  access= "Deny"
  protocol = "Tcp"
  source_port_range = "*"
  destination_port_range = "8080"
  source_address_prefix = "*"
  destination_address_prefix= "*"
  resource_group_name = "TFResourceGroup"
  network_security_group_name = azurerm_network_security_group.nsg.name
  
  
}

resource "azurerm_network_security_rule" "example2" {

  name= "Web8080"
  priority = 1001
  direction = "Inbound"
  access= "Allow"
  protocol = "Tcp"
  source_port_range = "*"
  destination_port_range = "80"
  source_address_prefix = "*"
  destination_address_prefix= "*"
  resource_group_name = "TFResourceGroup"
  network_security_group_name = azurerm_network_security_group.nsg.name
  
  
}

resource "azurerm_network_security_rule" "example3" {

  name= "WebOut"
  priority = 1000
  direction = "Outbound"
  access= "Deny"
  protocol = "Tcp"
  source_port_range = "*"
  destination_port_range = "80"
  source_address_prefix = "*"
  destination_address_prefix= "*"
  resource_group_name = "TFResourceGroup"
  network_security_group_name = azurerm_network_security_group.nsg.name
  
  
}