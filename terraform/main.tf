module "instance" {
  source                      = "./modules/oracle/terraform-oci-compute-instance"
  compartment_ocid            = var.compartment_ocid
  instance_display_name       = var.instance_display_name
  source_ocid                 = var.source_ocid
  subnet_ocids                = [module.oci_vcn.subnet_id["subnet1"]]
  public_ip                   = var.public_ip
  ssh_public_keys             = var.ssh_public_keys
  block_storage_sizes_in_gbs  = [153]
  shape                       = var.shape
  instance_flex_memory_in_gbs = 24
  instance_flex_ocpus         = 4
  primary_vnic_nsg_ids        = [oci_core_network_security_group.nsg-1.id]#[module.oci_core_network_security_group.nsgs]
  # user_data                   = file("user_data.sh")
}


module "oci_vcn" {
  source                  = "./modules/oracle/terraform-oci-vcn"
  tenancy_id              = var.tenancy_id
  compartment_id          = var.compartment_ocid
  label_prefix            = var.vcn_label_prefix
  vcn_cidrs               = ["10.1.0.0/23"]
  create_internet_gateway = true

  subnets = {
    sub1 = { name = "subnet1", ipv4cidr_blocks = ["10.1.0.0/24"], prohibit_internet_ingress = false }
    sub2 = { name = "subnet2", ipv4cidr_blocks = ["10.1.1.0/24"], prohibit_internet_ingress = false }
  }
}



resource "oci_core_network_security_group" "nsg-1" {
  compartment_id = var.compartment_ocid
  vcn_id         = module.oci_vcn.vcn_id
  display_name   = "nsg-1"
}

resource "oci_core_network_security_group_security_rule" "egress_rule_all" {
  network_security_group_id = oci_core_network_security_group.nsg-1.id
  direction                 = "EGRESS"
  protocol                  = "all"
  destination               = "0.0.0.0/0"
  destination_type          = "CIDR_BLOCK"
  stateless                 = false
}



resource "oci_core_network_security_group_security_rule" "ingress_rule_ssh" {
  network_security_group_id = oci_core_network_security_group.nsg-1.id
  direction                 = "INGRESS"
  protocol                  = "6" # TCP
  source                    = var.allowed_cidr_uri
  source_type               = "CIDR_BLOCK"
  tcp_options {
    destination_port_range {
      min = 22
      max = 22
    }
  }
  
  stateless = false
}
