module "vpc" {
  source  = "terraform-google-modules/network/google"
  version = "3.4.0"

  project_id   = var.project
  network_name = "gaurav-network"
  routing_mode = "GLOBAL"

  subnets = [
    {
      subnet_name   = "gaurav-subnet"
      subnet_ip     = "10.100.10.0/24"
      subnet_region = var.region
    }
  ]


  secondary_ranges = {
    gaurav-subnet = [
      {
        range_name    = "gaurav-subnet-secondary-01"
        ip_cidr_range = "192.168.64.0/24"
      }
    ]
  }

  routes = [
    {
      name              = "egress-internet"
      description       = "route through IGW to access internet"
      destination_range = "0.0.0.0/0"
      tags              = "egress-inet"
      next_hop_internet = "true"
    }
  ]
}
