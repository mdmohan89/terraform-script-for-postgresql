variable "resource-group" {
    default = "Database-psql"

}

variable "region" {
    default = "central india"
    
}

variable "vnet" {
    default = "database-vnet"
    
}


variable "network-prefix"{
    default = ["10.0.0.0/16"]
    
}

variable "subnet"{
    default = "internal"
    
}

variable "subnet-prefix"{
    default = ["10.0.0.0/24"]
    
}

variable "psql-name"{
    default = "postgresql-server-1"
    
}

variable "password"{
    default = "1234df!"
    
}

variable "username"{
    default = "adminuser"
    
}

variable "psql-network"{
    default = "psql-rule"
    
}