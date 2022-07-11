# fails
# todo check that vpc has vpc flow log defined
resource "alicloud_vpc" "main" {
  cidr_block = "192.168.0.0/24"
  name       = var.name
}

resource "alicloud_vpc_flow_log" "fail" {
  depends_on     = ["alicloud_vpc.default"]
  resource_id    = alicloud_vpc.default.id
  resource_type  = "VPC"
  traffic_type   = "All"
  log_store_name = var.log_store_name
  project_name   = var.project_name
  flow_log_name  = var.name
  status         = "Active"
}
