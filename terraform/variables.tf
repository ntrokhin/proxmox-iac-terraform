# ~/projects/allwan-iac/terraform/variables.tf

variable "pm_api_url" {
  description = "Proxmox API URL"
  type        = string
  sensitive   = true
}

variable "pm_token_id" {
  description = "Proxmox API Token ID (format: user@realm!token_name)"
  type        = string
  sensitive   = true
}

variable "pm_token_secret" {
  description = "Proxmox API Token Secret"
  type        = string
  sensitive   = true
}

variable "vm_count" {
  description = "Number of VMs to create"
  type        = number
  default     = 2
}

variable "ssh_public_key" {
  description = "Public SSH key for VM access"
  type        = string
  sensitive   = true
}
