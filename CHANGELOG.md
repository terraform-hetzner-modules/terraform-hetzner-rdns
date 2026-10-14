## [2.0.0](https://github.com/terraform-hetzner-modules/terraform-hetzner-rdns/compare/v1.0.0...v2.0.0) (2026-10-14)

### ⚠ BREAKING CHANGES

* **module/rdns:** require Terraform >= 1.7 and hcloud ~> 1.70. Entries now
use typed objects and reject missing or ambiguous targets and invalid IPs.

### Features

* **module/rdns:** refresh reverse DNS validation and repository tooling ([ce0d5c2](https://github.com/terraform-hetzner-modules/terraform-hetzner-rdns/commit/ce0d5c21c397fee7234ea27822b3da5043194e69))

### Bug Fixes

* **ci:** propagate verified release and Super-Linter fixes ([479bd93](https://github.com/terraform-hetzner-modules/terraform-hetzner-rdns/commit/479bd934487cfba5a01cdae4ad348ef7f2ec12ae))

## 1.0.0 (2024-11-19)

### Features

* initial release `v1.0.0` ([3e19a61](https://github.com/terraform-hetzner-modules/terraform-hetzner-rdns/commit/3e19a6151171b547e0d4fb3b0d075bea7348b428))
