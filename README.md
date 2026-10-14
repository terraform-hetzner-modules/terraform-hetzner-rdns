<p align="center">
    <!-- terraform-hetzner-rdns -->
<img src="https://cdn.simpleicons.org/terraform/844FBA" alt="Terraform Logo" align="center" width="128">
<img src="https://avatars.githubusercontent.com/u/30047064?s=200&v=4" alt="Hetzner Logo" align="center" width="128">
    <h1 align="center">Hetzner Cloud</h1>
    <h2 align="center"><code>rdns</code></h2>
</p>

[![License](https://img.shields.io/github/license/terraform-hetzner-modules/terraform-hetzner-rdns?label=License)](https://opensource.org/licenses/MIT)
[![Terraform](https://img.shields.io/badge/Terraform-_>=_1.7-brightgreen?logo=terraform&logoColor=623CE4)][terraform]
[![Opentofu](https://img.shields.io/badge/OpenTofu-_>=_1.8-brightgreen?logo=opentofu)][opentofu]
[![CI Status](https://github.com/terraform-hetzner-modules/terraform-hetzner-rdns/actions/workflows/testing.yaml/badge.svg)](https://github.com/terraform-hetzner-modules/terraform-hetzner-rdns/blob/main/.github/workflows/testing.yaml)
[![GitHub Release](https://img.shields.io/github/v/release/terraform-hetzner-modules/terraform-hetzner-rdns?label=Release)][github_releases]
[![GitHub Activity](https://img.shields.io/github/commit-activity/m/terraform-hetzner-modules/terraform-hetzner-rdns?label=Commits)][github_commits]
[![Renovate](https://img.shields.io/badge/Renovate-enabled-brightgreen?logo=renovate&logoColor=1A1F6C)][renovate]
[![Pre-Commit](https://img.shields.io/badge/PreCommit-enabled-brightgreen?logo=precommit&logoColor=FAB040)][pre-commit]

A [Terraform module][module] to create and manage reverse-DNS entries for your [Hetzner Cloud][hetzner] servers.

## ✨ TL;DR

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

## Compatibility and examples

Requires Terraform >= 1.7 (OpenTofu >= 1.8 tested) and hcloud ~> 1.70.
See [basic](examples/basic) and [full](examples/full) examples; configure credentials through `HCLOUD_TOKEN`.

Read the [upgrade guide](docs/UPGRADING.md) before moving from v1.
The generated [schema report](docs/SCHEMA.md) lists provider fields, module
mappings, and remaining coverage review items.
Run `terraform init -backend=false`, `terraform validate`, and `terraform test`
for credential-free validation and tests.

<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_hcloud"></a> [hcloud](#provider\_hcloud) | ~> 1.70 |

## Modules

No modules.

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_entries"></a> [entries](#input\_entries) | Named reverse DNS entries, each with exactly one resource ID. Removing an entry resets its PTR through the provider. | ```map(object({ dns_ptr = string ip_address = string server_id = optional(number) primary_ip_id = optional(number) floating_ip_id = optional(number) load_balancer_id = optional(number) }))``` | `{}` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_dns_ptr"></a> [dns\_ptr](#output\_dns\_ptr) | The Hetzner Cloud DNS pointer for the IP address. |
| <a name="output_floating_ip_id"></a> [floating\_ip\_id](#output\_floating\_ip\_id) | The unique ID for the floating IP the IP address belongs to. |
| <a name="output_id"></a> [id](#output\_id) | The unique ID of the Hetzner Cloud reverse DNS entry. |
| <a name="output_ip_address"></a> [ip\_address](#output\_ip\_address) | The IP address the Hetzner Cloud DNS entry should point to. |
| <a name="output_load_balancer_id"></a> [load\_balancer\_id](#output\_load\_balancer\_id) | The unique ID for the load balancer the IP address belongs to. |
| <a name="output_primary_ip_id"></a> [primary\_ip\_id](#output\_primary\_ip\_id) | The unique ID for the primary IP the IP address belongs to. |
| <a name="output_server_id"></a> [server\_id](#output\_server\_id) | The unique ID for the server the IP address belongs to. |
<!-- END_TF_DOCS -->

### 🔃 Contributing

Refer to our [documentation for contributors][contributing] for contributing guidelines, commit message
formats and versioning tips.

### 📥 Maintainers

This project is owned and maintained by [Terraform Hetzner Modules][org]. Refer to the [`AUTHORS`][authors] or [`CODEOWNERS`][owners]
for more information. You may also use the linked contact details to reach out directly.

### ©️ Copyright

- _Assets provided by:_ **[HashiCorp][hashicorp]**
- _Sources provided by:_ **[Terraform Hetzner Modules][org]** under the **[MIT License][license]**

<!-- INTERNAL REFERENCES -->

<!-- Project references -->

<!-- File references -->

[license]: LICENSE
[contributing]: docs/CONTRIBUTING.md
[authors]: .github/AUTHORS
[owners]: .github/CODEOWNERS

<!-- General links -->

[org]: https://github.com/terraform-hetzner-modules
[terraform]: https://terraform.io
[opentofu]: https://opentofu.org/
[hashicorp]: https://www.hashicorp.com/
[hetzner]: https://hetzner.com
[github_releases]: https://github.com/terraform-hetzner-modules/terraform-hetzner-rdns/releases
[github_commits]: https://github.com/terraform-hetzner-modules/terraform-hetzner-rdns/commits/main/

<!-- Third-party -->

[module]: https://registry.terraform.io/modules/terraform-hetzner-modules/rdns/hetzner/latest
[renovate]: https://renovatebot.com/
[pre-commit]: https://pre-commit.com/
