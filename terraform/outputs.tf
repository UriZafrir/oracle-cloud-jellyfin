output "instance_ip" {
  description = "The IP address of the created instance"
  value       = module.instance.public_ip#oci_core_instance.instance.public_ip
}
