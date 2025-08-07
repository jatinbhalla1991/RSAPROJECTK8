module "resource_group" {
  source = "./az.resourcegroup"
  resource_group_name = var.resource_group_name
  location = var.location
}

module "sql_server" {
  source = "./az.sqlserver"
  depends_on = [ module.resource_group ]
  sql_server_name= var.sql_server_name
  resource_group_name = module.resource_group.resource_group_name
  location = "westus"
}

module "sql-db" {
  source = "./az.sqldb"
  depends_on = [ module.sql_server ]
  sql_db_name = var.sql_db_name
  sql_server_id = module.sql_server.sql_server_id
}

module "aks" {
  source = "./az.aks"
  resource_group_name = module.resource_group.resource_group_name
  location = module.resource_group.location
  kubernetes_version = var.kubernetes_version
  vm_size = var.vm_size
  node_count = var.node_count
  aks_cluster_name = var.aks_cluster_name
  environment = var.environment
}
