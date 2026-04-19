# ~/projects/allwan-iac/terraform/outputs.tf

output "vm_ip" {
  description = "IPv4 address of the first created VM"
  value       = length(proxmox_virtual_environment_vm.test_vm) > 0 ? proxmox_virtual_environment_vm.test_vm[0].ipv4_addresses[1][0] : null
}

output "vm_ips" {
  description = "IPv4 addresses of all created VMs"
  value       = proxmox_virtual_environment_vm.test_vm[*].ipv4_addresses[1][0]
}
