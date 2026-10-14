mock_provider "hcloud" {}
run "empty_entries" {
  command = apply
  assert {
    condition     = length(output.id) == 0
    error_message = "Empty entries must create nothing."
  }
}
run "all_targets" {
  command = apply
  variables {
    entries = {
      server   = { server_id = 1, dns_ptr = "server.example.com", ip_address = "192.0.2.1" }
      primary  = { primary_ip_id = 2, dns_ptr = "primary.example.com", ip_address = "2001:db8::1" }
      floating = { floating_ip_id = 3, dns_ptr = "floating.example.com", ip_address = "192.0.2.3" }
      lb       = { load_balancer_id = 4, dns_ptr = "lb.example.com", ip_address = "192.0.2.4" }
    }
  }
  assert {
    condition     = length(output.id) == 4 && output.primary_ip_id.primary == 2 && output.ip_address.primary == "2001:db8::1"
    error_message = "All target kinds and IPv6 addresses must be supported."
  }
}
run "reject_multiple_targets" {
  command = plan
  variables { entries = { bad = { server_id = 1, primary_ip_id = 2, dns_ptr = "bad.example.com", ip_address = "192.0.2.1" } } }
  expect_failures = [var.entries]
}
run "reject_missing_target" {
  command = plan
  variables { entries = { bad = { dns_ptr = "bad.example.com", ip_address = "192.0.2.1" } } }
  expect_failures = [var.entries]
}
run "reject_invalid_address" {
  command = plan
  variables { entries = { bad = { server_id = 1, dns_ptr = "bad.example.com", ip_address = "192.0.2.1/24" } } }
  expect_failures = [var.entries]
}
