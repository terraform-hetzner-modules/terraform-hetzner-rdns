# Full rdns example

The example creates a server, Floating IP, Primary IP, and Load Balancer, then manages a PTR record
for each. Each entry sets exactly one resource ID; the other three resource ID fields are omitted.

Replace `example.com` with the hostnames you control and configure matching forward DNS separately.

## Running the example

Export `HCLOUD_TOKEN`, supply the inputs described in `variables.tf`, then run:

```shell
terraform init
terraform plan
terraform apply
```

This creates real infrastructure. Review the plan and any deletion protection before cleanup.
See the [module README](../../README.md) for usage and input descriptions.
