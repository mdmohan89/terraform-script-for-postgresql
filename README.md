# terraform-script-for-postgresql



 Prerequisites
 Before you proceed ensure you have the following prerequisites:

 Terraform installed on your local machine.
 An Azure account with appropriate permissions to create resources.
 Basic knowledge of Terraform and Azure concepts.
 Terraform Configuration
 The configuration includes the following resources:

 Resource Group (azurerm_resource_group): Defines the resource group where all Azure resources will be deployed.
 Virtual Network (azurerm_virtual_network): Defines the virtual network to which the PostgreSQL server will be connected.
 Subnet (azurerm_subnet): Defines the subnet within the virtual network for the PostgreSQL server.
 PostgreSQL Server (azurerm_postgresql_server): Defines the PostgreSQL server instance, including server name, SKU, storage, and credentials.
 Virtual Network Rule (azurerm_postgresql_virtual_network_rule): Defines a virtual network rule to allow access to the PostgreSQL server from specified subnets.
 Usage

Follow these steps to deploy the PostgreSQL database:

 Clone Repository: Clone this repository to your local machine:

Terraform Azure PostgreSQL Deployment
Overview
This Terraform configuration automates the deployment of an Azure PostgreSQL database along with associated networking resources. It simplifies the process of setting up a PostgreSQL server in Azure, including the creation of a resource group, virtual network, subnet, and PostgreSQL server instance.

Terraform Configuration
The configuration includes the following resources:

Resource Group (azurerm_resource_group.example): Defines the resource group where all Azure resources will be deployed.
Virtual Network (azurerm_virtual_network.example): Defines the virtual network to which the PostgreSQL server will be connected.
Subnet (azurerm_subnet.internal): Defines the subnet within the virtual network for the PostgreSQL server.
PostgreSQL Server (azurerm_postgresql_server.example): Defines the PostgreSQL server instance, including server name, SKU, storage, and credentials.
Virtual Network Rule (azurerm_postgresql_virtual_network_rule.example): Defines a virtual network rule to allow access to the PostgreSQL server from specified subnets.
Usage
Follow these steps to deploy the PostgreSQL database:

Clone Repository: Clone this repository to local machine:

`https://github.com/mdmohan89/terraform-script-for-postgresql.git`
Initialize Terraform: Initialize Terraform in the directory:

`terraform init`
Review Plan: Review the Terraform plan to ensure correctness:
`terraform plan`
Apply Configuration: Apply the Terraform configuration to create the resources:

`terraform apply`
Confirm Deployment: Confirm the deployment by typing yes when prompted.
Clean Up
To clean up and destroy the deployed resources:

`terraform destroy`
Confirm the destruction by typing yes when prompted.

