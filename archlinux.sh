proot -k 4 -r /mnt/base-us/documents/arch \
  -b /etc/host.conf \
  -b /etc/hosts \
  -b /etc/hosts.equiv \
  -b /etc/mtab \
  -b /etc/netgroup \
  -b /etc/networks \
  -b /etc/passwdxd \
  -b /etc/groupxd \
  -b /etc/nsswitch.conf \
  -b /etc/resolv.conf \
  -b /etc/localtime \
  -b /dev/ \
  -b /sys/ \
  -b /proc/ \
  -b /tmp/ \
  -0 \
  /bin/bash