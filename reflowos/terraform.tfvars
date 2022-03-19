# Projectname
projectname = "reflowos"

# OS Image
#sourceimage = "https://cloud-images.ubuntu.com/bionic/current/bionic-server-cloudimg-amd64.img"
sourceimage = "https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64.img"
#sourceimage = "https://cloud.centos.org/centos/8/x86_64/images/CentOS-8-GenericCloud-8.2.2004-20200611.2.x86_64.qcow2"
#sourceimage = "/home/juergen/images/CentOS-8-GenericCloud-8.2.2004-20200611.2.x86_64.qcow2"

# The baseimage is the source diskimage for all VMs created from the sourceimage
baseimagediskpool = "default"

# Domain and network settings
domainname = "mydomain.vm"  
networkname = "default"    # Virtual Networks: default (=NAT)

# Host specific settings
# RAM size in bytes
# Disksize in bytes (disksize must be bigger than sourceimage virtual size)
# Example:
#    qemu-img info debian-10.3.4-20200429-openstack-amd64.qcow2
#         virtual size: 2 GiB (2147483648 bytes)
hosts = {
   "paris" = {
      name     = "paris",
      vcpu     = 8
      memory   = "2048",
      diskpool = "default",
      disksize = 12000000000,
   },
   "milan" = {
      name     = "milan",
      vcpu     = 8
      memory   = "2048",
      diskpool = "default",
      disksize = 12000000000,
   },
   "berlin" = {
      name     = "berlin",
      vcpu     = 8
      memory   = "2048",
      diskpool = "default",
      disksize = 12000000000,
   },
}
