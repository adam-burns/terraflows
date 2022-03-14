# Deklarieren des libvirt Providers (einmal pro Modul)
terraform {
  required_providers {
    libvirt = {
      source  = "dmacvicar/libvirt"
#      version = "0.6.3"
    }
  }
}

# Definieren der virtuellen Server Resource (einmal pro Modul)
provider "libvirt" {
    uri = "qemu:///system"
}

# Die eigentliche Resourcenbeschreibung (was soll dieses Modul tun)
resource "libvirt_domain" "terraform_test" {
  name = "terraform_test"
}
