data "alicloud_zones" "default" {
  available_resource_creation = "VSwitch"
}

data "alicloud_instance_types" "default" {
  availability_zone    = data.alicloud_zones.default.zones.0.id
  cpu_core_count       = 2
  memory_size          = 4
  kubernetes_node_role = "Worker"
}


# Create a managed Kubernetes cluster.
resource "alicloud_cs_managed_kubernetes" "default" {
  name                         = var.name
  count                        = 1
  cluster_spec                 = "ack.standard"
  is_enterprise_security_group = true
  worker_number                = 2
  password                     = var.password
  pod_cidr                     = "172.20.0.0/16"
  service_cidr                 = "172.21.0.0/20"
  worker_vswitch_ids           = [alicloud_vswitch.default.id]
  worker_instance_types        = [data.alicloud_instance_types.default.instance_types.0.id]
}

# Create an auto-scaling node pool in the cluster.
resource "alicloud_cs_kubernetes_node_pool" "at1" {
  cluster_id     = alicloud_cs_managed_kubernetes.default.0.id
  name           = var.name
  vswitch_ids    = [alicloud_vswitch.default.id]
  instance_types = [data.alicloud_instance_types.default.instance_types.0.id]
  key_name       = alicloud_key_pair.default.key_name

  scaling_config {
    min_size = 0
    max_size = 1
  }

}
