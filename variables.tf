variable "compartment_ocid" {
  type        = string
  description = "OCID of the compartment where resources will be created"
}

variable "region" {
  type        = string
  description = "region"
}

variable "tenancy_id" {
  type        = string
  description = "OCID of the tenancy"
}

variable "vcn_label_prefix" {
  type        = string
  description = "Label prefix for VCN resources"
}

variable "vcn_cidrs" {
  type        = list(string)
  description = "List of CIDR blocks for the VCN"
}
variable "user_ocid" {
  type        = string
  description = "User OCID for OCI provider"
}

variable "instance_display_name" {
  type        = string
  description = "Display name for the compute instance"
}

variable "source_ocid" {
  type        = string
  description = "OCID of the source image or boot volume"
}

variable "public_ip" {
  type        = string
  description = "Whether to create a public IP. Valid values: NONE, RESERVED or EPHEMERAL"
}

variable "ssh_public_keys" {
  type        = string
  description = "SSH public key for instance access"
}

variable "shape" {
  type        = string
  description = "Shape of the instance"
}

variable "allowed_cidr" {
  type        = string
  description = "CIDR block allowed to access restricted ports (SSH, K8s API, 8096)"
}


variable "allowed_cidr_doron" {
  type        = string
  description = "CIDR block allowed to access restricted ports (SSH, K8s API, 8096)"
}

variable "allowed_cidr_shira" {
  type        = string
  description = "CIDR block allowed to access restricted ports (SSH, K8s API, 8096)"
}
