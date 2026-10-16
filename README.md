# Hetzner Reverse DNS Terraform module

Manage reverse DNS entries for servers, Primary IPs, Floating IPs, and Load Balancers.

## Usage

Copy this configuration into `main.tf`.

```hcl
data "hcloud_server" "web" {
  name = "web-01"
}

module "rdns" {
  source = "terraform-hetzner-modules/rdns/hetzner"

  entries = {
    web = {
      dns_ptr    = "web.example.com"
      ip_address = data.hcloud_server.web.ipv4_address
      server_id  = data.hcloud_server.web.id
    }
  }
}
```

This looks up an existing server named `web-01`. Replace the server name and hostname with your own.
Create the matching forward DNS record separately.

## Examples

- [Basic](examples/basic): a server PTR record.
- [Full](examples/full): all four supported resource types.

## Configuration

Use stable keys in `entries`. Every entry specifies an address, a PTR hostname, and exactly one of
`server_id`, `primary_ip_id`, `floating_ip_id`, or `load_balancer_id`. IDs and addresses can come from
resource or module outputs. Manage each address's PTR record in one place.

This module configures reverse DNS only. Forward DNS records and their consistency with the PTR
hostname remain your responsibility. Removing an entry removes its managed custom PTR configuration.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
| ---- | ------- |
| terraform | >= 1.7 |
| hcloud | ~> 1.70 |

## Providers

| Name | Version |
| ---- | ------- |
| hcloud | ~> 1.70 |

## Resources

| Name | Type |
| ---- | ---- |
| [hcloud_rdns.current](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/rdns) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| entries | Named reverse DNS entries, each with exactly one resource ID. Removing an entry resets its PTR through the provider. | ```map(object({ dns_ptr = string ip_address = string server_id = optional(number) primary_ip_id = optional(number) floating_ip_id = optional(number) load_balancer_id = optional(number) }))``` | `{}` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| dns\_ptr | The Hetzner Cloud DNS pointer for the IP address. |
| floating\_ip\_id | The unique ID for the floating IP the IP address belongs to. |
| id | The unique ID of the Hetzner Cloud reverse DNS entry. |
| ip\_address | The IP address the Hetzner Cloud DNS entry should point to. |
| load\_balancer\_id | The unique ID for the load balancer the IP address belongs to. |
| primary\_ip\_id | The unique ID for the primary IP the IP address belongs to. |
| server\_id | The unique ID for the server the IP address belongs to. |
<!-- END_TF_DOCS -->

## Contributing

See [CONTRIBUTING.md](docs/CONTRIBUTING.md) for local checks and contribution guidelines, and
[UPGRADING.md](docs/UPGRADING.md) for compatibility and live acceptance checks. The generated
[schema report](docs/SCHEMA.md) documents provider coverage and intentional omissions.

## Authors

Maintained by [Terraform Hetzner Modules](https://github.com/terraform-hetzner-modules).
See [AUTHORS](.github/AUTHORS) and [CODEOWNERS](.github/CODEOWNERS).

## License

MIT. See [LICENSE](LICENSE).
