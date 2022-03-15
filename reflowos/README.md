# ReflowOS deployment

```
cowsay perform Host preparation first
make init   # init terraform
make apply  # apply terraform
cowsay make a coffee and come back
make play   # perform ansible install on hosts in hosts.yml
```


## Host preparation


### DNS resolution for KVM hostnames

TODO: try to script setup for KVM libvirt host (in an agnostic way)

```
$ cat /etc/NetworkManager/conf.d/localdns.conf 
[main]
dns=dnsmasq
```

& for setting it up on a host named 'zembla' (so for now, lets use a local tld of 'zembla')

```
$ cat /etc/NetworkManager/dnsmasq.d/libvirt_dnsmasq.conf 
server=/zembla/192.168.122.1
```

(if applicable, note in comments about systemd-resolved, one shot of the following is required for the VM host to resolve libvirt host

```
sudo resolvectl dns virbr0 192.168.122.1
sudo resolvectl domain virbr0 zembla
```
this setting does not currently survive a reboot)

Add domain name for the VM hosts ...
```
sudo virsh net-edit default
```

Add `<domain name= ...` line as below

```
<network>
  <name>default</name>
  <uuid>42c3a8d7-4878-4776-95d6-b56025f7d66d</uuid>
  <forward mode='nat'/>
  <bridge name='virbr0' stp='on' delay='0'/>
  <mac address='52:54:00:a2:77:19'/>
  <domain name='zembla' localOnly='yes'/>
  <ip address='192.168.122.1' netmask='255.255.255.0'>
    <dhcp>
      <range start='192.168.122.2' end='192.168.122.254'/>
    </dhcp>
  </ip>
</network>
```
```
virsh net-destroy default
virsh net-start default
```

See https://liquidat.wordpress.com/2017/03/03/howto-automated-dns-resolution-for-kvmlibvirt-guests-with-a-local-domain/ for further info.

##  SSH key for ansible

TODO: template and generate cloud_init.cfg for terraform

Until this is done, the following manual steps are required:

#### Generate project wide ssh key pair

```
export PROJECT="reflowos"
ssh-keygen -t ed25519 -f id_25519 -C $(PROJECT) -N "" -q
```

#### Insert public key into cloud_init.cfg

Insert the public key generated in the above step in the section for the ansible user.


