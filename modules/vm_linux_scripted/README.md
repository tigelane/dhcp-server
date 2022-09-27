# linux

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_null"></a> [null](#provider\_null) | n/a |
| <a name="provider_vsphere"></a> [vsphere](#provider\_vsphere) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [null_resource.script_trigger](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [vsphere_virtual_machine.node](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/resources/virtual_machine) | resource |
| [vsphere_compute_cluster.cluster](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/data-sources/compute_cluster) | data source |
| [vsphere_datacenter.dc](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/data-sources/datacenter) | data source |
| [vsphere_datastore.datastore](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/data-sources/datastore) | data source |
| [vsphere_network.network](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/data-sources/network) | data source |
| [vsphere_virtual_machine.template](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/data-sources/virtual_machine) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_disk_template"></a> [disk\_template](#input\_disk\_template) | (Required) vSphere template to clone for this VM | `string` | n/a | yes |
| <a name="input_dns_server_list"></a> [dns\_server\_list](#input\_dns\_server\_list) | (Optional) List of string for the DNS servers to use | `list(any)` | <pre>[<br>  ""<br>]</pre> | no |
| <a name="input_domain"></a> [domain](#input\_domain) | (Required) Domain name for this node | `string` | n/a | yes |
| <a name="input_hostname"></a> [hostname](#input\_hostname) | (Required) The host name for this node | `string` | n/a | yes |
| <a name="input_masklength"></a> [masklength](#input\_masklength) | (optional) Netmask length of the IP Subnet the VM will be on 24/16/etc | `number` | `24` | no |
| <a name="input_network_gateway_ip"></a> [network\_gateway\_ip](#input\_network\_gateway\_ip) | (Optional) IP Address of default gateway | `string` | `""` | no |
| <a name="input_node_memory"></a> [node\_memory](#input\_node\_memory) | (Optional) Memory in MB to configure for this node | `number` | `4096` | no |
| <a name="input_node_num_cpus"></a> [node\_num\_cpus](#input\_node\_num\_cpus) | (Optional) Virtual CPUs to configure for this node | `number` | `2` | no |
| <a name="input_root_volume_size"></a> [root\_volume\_size](#input\_root\_volume\_size) | (Required) The size of the root volume in gigabytes. | `number` | `40` | no |
| <a name="input_script_name"></a> [script\_name](#input\_script\_name) | (Optional) Name of the script to run after the VM is up | `string` | `""` | no |
| <a name="input_script_user_name"></a> [script\_user\_name](#input\_script\_user\_name) | (Optional) User name to login and run script | `string` | `""` | no |
| <a name="input_script_user_password"></a> [script\_user\_password](#input\_script\_user\_password) | (Optional) Password to login and run script | `string` | `""` | no |
| <a name="input_vm_ip"></a> [vm\_ip](#input\_vm\_ip) | (Required) IP Address of the new Virtual Machine | `string` | n/a | yes |
| <a name="input_vsphere_compute_cluster"></a> [vsphere\_compute\_cluster](#input\_vsphere\_compute\_cluster) | (Required) vSphere compute cluster to use | `string` | n/a | yes |
| <a name="input_vsphere_datacenter"></a> [vsphere\_datacenter](#input\_vsphere\_datacenter) | (Required) The vSphere datacenter in which to create the virtual machine | `string` | n/a | yes |
| <a name="input_vsphere_datastore"></a> [vsphere\_datastore](#input\_vsphere\_datastore) | (Required) vSphere datastore to use | `string` | n/a | yes |
| <a name="input_vsphere_folder"></a> [vsphere\_folder](#input\_vsphere\_folder) | (Optional) The vsphere folder in which to place the virtual machine | `string` | `""` | no |
| <a name="input_vsphere_network"></a> [vsphere\_network](#input\_vsphere\_network) | (Required) vSphere network to use | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_public_ip"></a> [public\_ip](#output\_public\_ip) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
