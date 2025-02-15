module "instance" {
  source                      = "./Oracle/terraform-oci-compute-instance"
  compartment_ocid            = var.compartment_ocid
  instance_display_name       = var.instance_display_name
  source_ocid                 = var.source_ocid
  subnet_ocids                = [module.oci_vcn.subnet_id["subnet1"]]
  public_ip                   = var.public_ip
  ssh_public_keys             = var.ssh_public_keys
  block_storage_sizes_in_gbs  = [200]
  shape                       = var.shape
  instance_flex_memory_in_gbs = 24
  instance_flex_ocpus         = 4
}


module "oci_vcn" {
  source                  = "./Oracle/terraform-oci-vcn"
  tenancy_id              = var.tenancy_id
  compartment_id          = var.compartment_ocid
  label_prefix            = var.vcn_label_prefix
  vcn_cidrs               = var.vcn_cidrs
  create_internet_gateway = true

  subnets = {
    sub1 = { name = "subnet1", cidr_block = "10.0.0.0/24" }
    sub2 = { name = "subnet2", cidr_block = "10.0.1.0/24" }
  }
}
