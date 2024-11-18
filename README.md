# _Hetzner Cloud_ - rDNS <img src="https://avatars.githubusercontent.com/u/30047064?s=200&v=4" alt="Hetzner Logo" align="right" width="128"/> <img src="https://raw.githubusercontent.com/fmjstudios/artwork/refs/heads/main/projects/terraform/icon/color/terraform-icon-color.png" alt="Terraform Logo" align="right" width="128"/>

A [Terraform module][module] to create and manage reverse-DNS entries for your [Hetzner Cloud][hetzner] servers.

## ✨ TL;DR

```shell
module "hetzner_server_apache" {
  source = "terraform-hetzner-modules/cloud/rdns"
  ...
}
```

<!-- BEGIN_TF_DOCS -->

## Providers

| Name                                                      | Version |
| --------------------------------------------------------- | ------- |
| <a name="provider_hcloud"></a> [hcloud](#provider_hcloud) | ~> 1.49 |

## Modules

No modules.

## Inputs

| Name                                                   | Description                 | Type  | Default | Required |
| ------------------------------------------------------ | --------------------------- | ----- | ------- | :------: |
| <a name="input_entries"></a> [entries](#input_entries) | The rDNS entries to manage. | `any` | `{}`    |    no    |

## Outputs

| Name                                                                                | Description                                                    |
| ----------------------------------------------------------------------------------- | -------------------------------------------------------------- |
| <a name="output_dns_ptr"></a> [dns_ptr](#output_dns_ptr)                            | The Hetzner Cloud DNS pointer for the IP address.              |
| <a name="output_floating_ip_id"></a> [floating_ip_id](#output_floating_ip_id)       | The unique ID for the floating IP the IP address belongs to.   |
| <a name="output_id"></a> [id](#output_id)                                           | The unique ID of the Hetzner Cloud reverse DNS entry.          |
| <a name="output_ip_address"></a> [ip_address](#output_ip_address)                   | The IP address the Hetzner Cloud DNS entry should point to.    |
| <a name="output_load_balancer_id"></a> [load_balancer_id](#output_load_balancer_id) | The unique ID for the load balancer the IP address belongs to. |
| <a name="output_primary_ip_id"></a> [primary_ip_id](#output_primary_ip_id)          | The unique ID for the primary IP the IP address belongs to.    |
| <a name="output_server_id"></a> [server_id](#output_server_id)                      | The unique ID for the server the IP address belongs to.        |

<!-- END_TF_DOCS -->

### 🔃 Contributing

Refer to our [documentation for contributors][contributing] for contributing guidelines, commit message
formats and versioning tips.

### 📥 Maintainers

This project is owned and maintained by [FMJ Studios][org] refer to the [`AUTHORS`][authors] or [`CODEOWNERS`][owners]
for more information. You may also use the linked contact details to reach out directly.

### ©️ Copyright

- _Assets provided by:_ **[HashCorp][hashicorp]**
- _Sources provided by:_ **[FMJ Studios][org]** under the **[MIT License][license]**

<!-- INTERNAL REFERENCES -->

<!-- Project references -->

<!-- File references -->

[license]: LICENSE
[contributing]: docs/CONTRIBUTING.md
[authors]: .github/AUTHORS
[owners]: .github/CODEOWNERS

<!-- General links -->

[org]: https://github.com/fmjstudios
[hashicorp]: https://www.hashicorp.com/
[hetzner]: https://hetzner.com

<!-- Third-party -->

[module]: https://registry.terraform.io/modules/terraform-hetzner-modules/compute/server/latest
