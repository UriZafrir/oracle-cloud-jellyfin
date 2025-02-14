# module "instance" {
#   source = "./Oracle/terraform-oci-compute-instance"
#   instance_count             = 1 # how many instances do you want?
#   ad_number                  = 1 # AD number to provision instances. If null, instances are provisionned in a rolling manner starting with AD1
#   compartment_ocid           = var.compartment_ocid
#   instance_display_name      = var.instance_display_name
#   source_ocid                = var.source_ocid
#   subnet_ocids               = var.subnet_ocids
#   public_ip                  = var.public_ip # NONE, RESERVED or EPHEMERAL
#   ssh_public_keys            = var.ssh_public_keys
#   block_storage_sizes_in_gbs = [50]
#   shape                      = var.shape
#   instance_state             = var.instance_state # RUNNING or STOPPED
#   boot_volume_backup_policy  = var.boot_volume_backup_policy # disabled, gold, silver or bronze
# }
