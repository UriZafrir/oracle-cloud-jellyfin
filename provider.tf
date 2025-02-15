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
  private_key_path = "C:/Users/uriza/.oci/rsa-key.pem"
  fingerprint      = "65:83:f6:25:5c:4d:6c:ab:12:d9:9b:74:ed:4c:7d:fd"
  region           = var.region #"eu-frankfurt-1"#"il-jerusalem-1"
}