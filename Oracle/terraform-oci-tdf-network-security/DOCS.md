<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_oci"></a> [oci](#provider\_oci) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [oci_core_network_security_group.this](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_network_security_group) | resource |
| [oci_core_network_security_group_security_rule.egress_rules_icmp_type_code](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_network_security_group_security_rule) | resource |
| [oci_core_network_security_group_security_rule.egress_rules_icmp_type_no_code](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_network_security_group_security_rule) | resource |
| [oci_core_network_security_group_security_rule.egress_rules_other](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_network_security_group_security_rule) | resource |
| [oci_core_network_security_group_security_rule.egress_rules_tcp_no_src_dst](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_network_security_group_security_rule) | resource |
| [oci_core_network_security_group_security_rule.egress_rules_tcp_src_dst](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_network_security_group_security_rule) | resource |
| [oci_core_network_security_group_security_rule.egress_rules_tcp_src_no_dst](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_network_security_group_security_rule) | resource |
| [oci_core_network_security_group_security_rule.egress_rules_udp_no_src_dst](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_network_security_group_security_rule) | resource |
| [oci_core_network_security_group_security_rule.egress_rules_udp_src_dst](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_network_security_group_security_rule) | resource |
| [oci_core_network_security_group_security_rule.egress_rules_udp_src_no_dst](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_network_security_group_security_rule) | resource |
| [oci_core_network_security_group_security_rule.ingress_rules_icmp_type_code](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_network_security_group_security_rule) | resource |
| [oci_core_network_security_group_security_rule.ingress_rules_icmp_type_no_code](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_network_security_group_security_rule) | resource |
| [oci_core_network_security_group_security_rule.ingress_rules_other](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_network_security_group_security_rule) | resource |
| [oci_core_network_security_group_security_rule.ingress_rules_tcp_no_src_dst](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_network_security_group_security_rule) | resource |
| [oci_core_network_security_group_security_rule.ingress_rules_tcp_src_dst](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_network_security_group_security_rule) | resource |
| [oci_core_network_security_group_security_rule.ingress_rules_tcp_src_no_dst](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_network_security_group_security_rule) | resource |
| [oci_core_network_security_group_security_rule.ingress_rules_udp_no_src_dst](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_network_security_group_security_rule) | resource |
| [oci_core_network_security_group_security_rule.ingress_rules_udp_src_dst](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_network_security_group_security_rule) | resource |
| [oci_core_network_security_group_security_rule.ingress_rules_udp_src_no_dst](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_network_security_group_security_rule) | resource |
| [oci_core_security_list.this](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_security_list) | resource |
| [oci_core_network_security_groups.this](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/data-sources/core_network_security_groups) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_default_compartment_id"></a> [default\_compartment\_id](#input\_default\_compartment\_id) | The default compartment OCID to use for resources (unless otherwise specified). | `string` | n/a | yes |
| <a name="input_default_defined_tags"></a> [default\_defined\_tags](#input\_default\_defined\_tags) | The different defined tags that are applied to each object by default. | `map(string)` | `{}` | no |
| <a name="input_default_freeform_tags"></a> [default\_freeform\_tags](#input\_default\_freeform\_tags) | The different freeform tags that are applied to each object by default. | `map(string)` | `{}` | no |
| <a name="input_nsgs"></a> [nsgs](#input\_nsgs) | Parameters for customizing Network Security Group(s). | <pre>map(object({<br/>    compartment_id  = string,<br/>    defined_tags    = map(string),<br/>    freeform_tags   = map(string),<br/>    ingress_rules   = list(object({<br/>      description   = string,<br/>      stateless     = bool,<br/>      protocol      = string,<br/>      src           = string,<br/>      # Allowed values: CIDR_BLOCK, SERVICE_CIDR_BLOCK, NETWORK_SECURITY_GROUP, NSG_NAME<br/>      src_type      = string,<br/>      src_port      = object({<br/>        min         = number,<br/>        max         = number<br/>      }),<br/>      dst_port      = object({<br/>        min         = number,<br/>        max         = number<br/>      }),<br/>      icmp_type     = number,<br/>      icmp_code     = number<br/>    })),<br/>    egress_rules    = list(object({<br/>      description   = string,<br/>      stateless     = bool,<br/>      protocol      = string,<br/>      dst           = string,<br/>      # Allowed values: CIDR_BLOCK, SERVICE_CIDR_BLOCK, NETWORK_SECURITY_GROUP, NSG_NAME<br/>      dst_type      = string,<br/>      src_port      = object({<br/>        min         = number,<br/>        max         = number<br/>      }),<br/>      dst_port      = object({<br/>        min         = number,<br/>        max         = number<br/>      }),<br/>      icmp_type     = number,<br/>      icmp_code     = number<br/>    }))<br/>  }))</pre> | `{}` | no |
| <a name="input_security_lists"></a> [security\_lists](#input\_security\_lists) | Parameters for customizing Security List(s). | <pre>map(object({<br/>    compartment_id  = string,<br/>    defined_tags    = map(string),<br/>    freeform_tags   = map(string),<br/>    ingress_rules   = list(object({<br/>      stateless     = bool,<br/>      protocol      = string,<br/>      src           = string,<br/>      src_type      = string,<br/>      src_port      = object({<br/>        min         = number,<br/>        max         = number<br/>      }),<br/>      dst_port      = object({<br/>        min         = number,<br/>        max         = number<br/>      }),<br/>      icmp_type     = number,<br/>      icmp_code     = number<br/>    })),<br/>    egress_rules    = list(object({<br/>      stateless     = bool,<br/>      protocol      = string,<br/>      dst           = string,<br/>      dst_type      = string,<br/>      src_port      = object({<br/>        min         = number,<br/>        max         = number<br/>      }),<br/>      dst_port      = object({<br/>        min         = number,<br/>        max         = number<br/>      }),<br/>      icmp_type     = number,<br/>      icmp_code     = number<br/>    }))<br/>  }))</pre> | `{}` | no |
| <a name="input_standalone_nsg_rules"></a> [standalone\_nsg\_rules](#input\_standalone\_nsg\_rules) | Any standalone NSG rules that should be added (whether or not the NSG is defined here). | <pre>object({<br/>    ingress_rules   = list(object({<br/>      nsg_id        = string,<br/>      description   = string,<br/>      stateless     = bool,<br/>      protocol      = string,<br/>      src           = string,<br/>      # Allowed values: CIDR_BLOCK, SERVICE_CIDR_BLOCK, NETWORK_SECURITY_GROUP, NSG_NAME<br/>      src_type      = string,<br/>      src_port      = object({<br/>        min         = number,<br/>        max         = number<br/>      }),<br/>      dst_port      = object({<br/>        min         = number,<br/>        max         = number<br/>      }),<br/>      icmp_type     = number,<br/>      icmp_code     = number<br/>    })),<br/>    egress_rules    = list(object({<br/>      nsg_id        = string,<br/>      description   = string,<br/>      stateless     = bool,<br/>      protocol      = string,<br/>      dst           = string,<br/>      # Allowed values: CIDR_BLOCK, SERVICE_CIDR_BLOCK, NETWORK_SECURITY_GROUP, NSG_NAME<br/>      dst_type      = string,<br/>      src_port      = object({<br/>        min         = number,<br/>        max         = number<br/>      }),<br/>      dst_port      = object({<br/>        min         = number,<br/>        max         = number<br/>      }),<br/>      icmp_type     = number,<br/>      icmp_code     = number<br/>    }))<br/>  })</pre> | <pre>{<br/>  "egress_rules": [],<br/>  "ingress_rules": []<br/>}</pre> | no |
| <a name="input_vcn_id"></a> [vcn\_id](#input\_vcn\_id) | The VCN ID where the Security List(s) should be created. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_nsg_egress_rules"></a> [nsg\_egress\_rules](#output\_nsg\_egress\_rules) | The egress NSG rules created/managed. |
| <a name="output_nsg_ingress_rules"></a> [nsg\_ingress\_rules](#output\_nsg\_ingress\_rules) | The ingress NSG rules created/managed. |
| <a name="output_nsg_rules"></a> [nsg\_rules](#output\_nsg\_rules) | The NSG rules created/managed. |
| <a name="output_nsgs"></a> [nsgs](#output\_nsgs) | The Network Security Group(s) (NSGs) created/managed. |
| <a name="output_security_lists"></a> [security\_lists](#output\_security\_lists) | The security list(s) created/managed. |
<!-- END_TF_DOCS -->