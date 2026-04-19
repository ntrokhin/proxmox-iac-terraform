# ~/projects/allwan-iac/terraform/main.tf

resource "random_integer" "vm_id" {
  count = var.vm_count
  min   = 165
  max   = 195
  keepers = {
    index = count.index
  }
}

resource "proxmox_virtual_environment_vm" "test_vm" {
  count     = var.vm_count
  name      = "test-terraform-vm-${count.index + 1}"
  node_name = "krypton"
  vm_id     = random_integer.vm_id[count.index].result

  clone {
    vm_id = 199
  }

  cpu {
    cores = 2
  }

  memory {
    dedicated = 2048
  }

  network_device {
    bridge = "vmbr77"
  }

  initialization {
    datastore_id = "local-zfs"
    ip_config {
      ipv4 {
        # Статический IP: последний октет равен VMID
        address = "192.168.77.${random_integer.vm_id[count.index].result}/24"
        gateway = "192.168.77.100"
      }
    }
    user_account {
      username = "ansible"
      keys     = [var.ssh_public_key]
    }
  }

  agent {
    enabled = true
  }

  disk {
    datastore_id = "local-zfs"
    file_format  = "raw"
    interface    = "scsi0"
    size         = 30
  }
}
# force recreate with updated SSH key
# force recreate with updated SSH key
