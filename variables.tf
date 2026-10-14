variable "entries" {
  type = map(object({
    dns_ptr          = string
    ip_address       = string
    server_id        = optional(number)
    primary_ip_id    = optional(number)
    floating_ip_id   = optional(number)
    load_balancer_id = optional(number)
  }))
  description = "Named reverse DNS entries, each with exactly one resource ID. Removing an entry resets its PTR through the provider."
  default     = {}
  nullable    = false
  validation {
    condition     = alltrue([for e in var.entries : length([for id in [e.server_id, e.primary_ip_id, e.floating_ip_id, e.load_balancer_id] : id if id != null]) == 1])
    error_message = "Every entry must specify exactly one server, primary IP, floating IP, or load balancer ID."
  }
  validation {
    condition     = alltrue([for e in var.entries : can(cidrhost("${e.ip_address}/${strcontains(e.ip_address, ":") ? 128 : 32}", 0))])
    error_message = "ip_address must be a valid IPv4 or IPv6 address without a prefix."
  }
}
