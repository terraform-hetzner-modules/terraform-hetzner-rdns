module "rdns_example" {
  source = ".."

  entries = {
    node1 = {
      dns_ptr    = "example.com"
      ip_address = hcloud_server.node1.ipv4_address
      server_id  = hcloud_server.node1.id
    }
  }
}

resource "hcloud_server" "node1" {
  name        = "node1"
  image       = "debian-11"
  server_type = "cx11"
}
