terraform {
  required_version = ">= 0.12.6"
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = ">= 4.0.0"
    }
  }
}

provider "oci" {
  tenancy_ocid     = var.tenancy_id #"ocid1.tenancy.oc1..aaaaaaaa66wkuhn3lioj44arbaokoeukfjlnt2njqghj52faoaganmsfl35a"
  user_ocid        = var.user_ocid  #"ocid1.user.oc1..aaaaaaaablgybdsk4lpod3ntahqrpfhdb3dvwlxeu4i4e4fw6lforfysrw6a" 
  private_key_path = "~/.oci/oci_api_key.pem"
  fingerprint      = "06:74:5b:55:93:6e:94:5e:cc:8e:5d:46:d1:b0:4e:e0"
  region           = var.region #"eu-frankfurt-1"#"il-jerusalem-1"
}