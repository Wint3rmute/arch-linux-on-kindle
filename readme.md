# Arch Linux on your Kindle

#### Proof

![Proof](proof.jpg)
[More images](https://imgur.com/a/8PgtJt4)

**Warning: this "mod" breaks the USB file transfer - but you can use `scp` to transfer ebooks via WiFi (which i find even better)**.

# Instruction
## Prerequisites

* Root your Kindle: [tutorial](https://wiki.mobileread.com/wiki/Kindle_Touch_Hacking)
* Install an [application launcher KUAL](https://www.mobileread.com/forums/showthread.php?t=225030)
* Install a [terminal emulator](https://github.com/bfabiszewski/kterm)
* Enable [USBNetworking for SSH access](https://wiki.mobileread.com/wiki/Kindle_Touch_Hacking#USB_Networking) (or just use the terminal emulator)
* Check your Kindle's CPU architecture (Armv6/Armv7?)
* Format your `/dev/mmcblk0p4` to `ext3` (or `ext4`, i've only tried `ext3` because that's how Kindle's root partition was formatted by default)
* Modify your `/etc/fstab` file to look like [this](./fstab) - so the `ext3` partition will mount.

## Downloads
* Get [proot](https://proot-me.github.io/) onto your Kindle (put it into `/usr/bin/`)
* Get [ArchLinuxArm](https://archlinuxarm.org/) build for your CPU (i went with [this](https://archlinuxarm.org/platforms/armv7/freescale/usb-armory-mk-ii) for my PaperWhite 3)

## Optional but useful: allow SSH via WiFi
* Edit `/etc/sysconfig/iptables` (you have `vi` installed by default)
* Append `-A INPUT -i wlan0 -j ACCEPT` before the last line of the file:


```iptables

# ICMP. Allow only responses to local connections
-A INPUT -p icmp -m state --state RELATED,ESTABLISHED -j ACCEPT

# The line from the Arch tutorial you have to append
-A INPUT -i wlan0 -j ACCEPT
COMMIT
```

## Installation
* Extract the system (preferably into `/mnt/base-us/arch`, but the choice is yours. Be careful not to extract the system to `/mnt/base-us/documents` as it will make your kindle try to index the system files as ebooks)
* Copy [this script](archlinux.sh) into your ebook (preferably to `/usr/bin`)
* Run the script (change the proot directory in the script, if you've extracted the system to a custom location)

## Post-install
* [Fix the keyring](https://unix.stackexchange.com/questions/450119/pacman-cannot-install-arch-linux-keyring-on-arch-linux-arm) (`pacman` won't work otherwise):
    * `pacman-key -u`
    * `pacman-key --populate`



# Other stuff that might be useful
* [Scripts to control various functions of your Kindle](https://wiki.mobileread.com/wiki/Kindle_Touch_Hacking#Interesting_handlers_.2F_actions)
