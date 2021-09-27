resource "alicloud_vpc" "default" {
  vpc_name       = var.name
  cidr_block = "10.1.0.0/21"
}
resource "alicloud_vswitch" "default" {
  vswitch_name      = var.name
  vpc_id            = alicloud_vpc.default.id
  cidr_block        = "10.1.1.0/24"
  zone_id = data.alicloud_zones.default.zones.0.id
}
resource "alicloud_key_pair" "default" {
  key_pair_name = var.name
}
