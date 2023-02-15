# [Installation guide](https://wiki.archlinux.org/title/Installation_guide)

[archinstall](https://wiki.archlinux.org/title/Archinstall)

This document is a guide for installing [Arch Linux](https://wiki.archlinux.org/title/Arch_Linux) using the live system booted from an installation medium made from an official installation image.

## Pre-installation

### Acquire an installation image

Visit the [Download](https://archlinux.org/download) page and acquire the ISO file.

### Prepare an installation medium

The installation image can be supplied to the target machine via a USB flash drive, for example by using basic command line utilities. This method is recommended due to its simplicity and universal availability.

Find out the name of your USB drive with `lsblk`. Make sure that it is **not** mounted.

Run the following command, replacing /dev/**sdx** with your drive, e.g. /dev/sdb. (Do **not** append a partition number, so do **not** use something like /dev/sdb**1**):
```bash
# cp path/to/archlinux-version-x86_64.iso /dev/sdx
```

### Boot the live environment

To stop the beep sound, run `rmmod pcspkr`.

### Set the console keyboard layout

The default console keymap is US.

To set the keyboard layout, pass a corresponding file name to `loadkeys`, omitting path and file extension. 
```bash
loadkeys br-abnt
```
### Connect to the internet

To set up a network connection in the live environment, go through the following steps:
- Ensure your network interface is listed and enabled:
```bash
# ip link
```

- For wireless and WWAN, make sure the card is not blocked.
```bash
# rfkill unblock wifi
```

- Connect to the network:
    - Ethernet—plug in the cable.
    - Wi-Fi—authenticate to the wireless network using [`iwctl`](https://wiki.archlinux.org/title/Iwctl).
    - Mobile broadband modem—connect to the mobile network with the [`mmcli`](https://wiki.archlinux.org/title/Mmcli) utility.

- The connection may be verified with `ping`:
```bash
# ping archlinux.org
```

### Update the system clock

Use `timedatectl` to set the system time zone to the specified value. 
```bash
# timedatectl set-timezone America/Sao_Paulo
```

To ensure the system clock is accurate:
```bash
# timedatectl status
```

### Partition the disks

To identify the devices, use [`lsblk`](https://wiki.archlinux.org/title/Lsblk) or [`fdisk`](https://wiki.archlinux.org/title/Fdisk).
```bash
# fdisk -l
```

Then modify partition tables.
```bash
# fdisk /dev/the_disk_to_be_partitioned
```

| **Mount point** | **Partition** | **Size** |
| :---: | :---: | :---: |
| /mnt/boot/efi | /dev/efi_system_partition | At least 300 MiB |
| [SWAP] | /dev/swap_partition | More than 512 MiB |
| /mnt | /dev/root_partition | Remainder of the device |

### Format the partitions

Once the partitions have been created, each newly created partition must be formatted with an appropriate file system. 
```bash
# mkfs.vfat /dev/efi_system_partition
# mkswap /dev/swap_partition
# mkfs.ext4 /dev/root_partition
```

### Mount the file systems

Mount the root volume to `/mnt`.
```bash
# mount /dev/root_partition /mnt
# mkdir -p /mnt/boot/efi 
# mount /dev/efi_system_partition /mnt/boot/efi
# swapon /dev/swap_partition
```

## Installation

### Select the mirrors

To enable mirrors, edit `/etc/pacman.d/mirrorlist` and locate your geographic region. Uncomment mirrors you would like to use.

### Install essential packages
Use the `pacstrap` script to install the base package, Linux kernel and firmware for common hardware:
```bash
# pacstrap -K /mnt base linux linux-firmware
```

## Configure the system

### Fstab

Generate an `fstab` file (use -U or -L to define by UUID or labels, respectively):
```bash
# genfstab -U /mnt >> /mnt/etc/fstab
```

### Chroot

Change root into the new system:
```bash
# arch-chroot /mnt
```

### Install other packages

```bash
# pacman -S grub efibootmgr base-devel neovim sudo git cmake make dhcpcd iwd
```

### Time zone, Localization and Network configuration

Set the time zone:
```bash
# ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
# hwclock --systohc --utc
```

Edit `/etc/locale.gen` and uncomment `pt_BR.UTF-8 UTF-8`. Generate the locales by running:
```bash
# locale-gen
```

```bash
# echo "LANG=pt_BR.UTF-8" > /etc/locale.conf
# echo "KEYMAP=br-abnt" > /etc/vconsole.conf
# echo "Arch" > /etc/hostname
```

### Initramfs

Creating a new initramfs is usually not required, because mkinitcpio was run on installation of the kernel package with pacstrap.
```bash
# mkinitcpio -P
```

### Root password

Set the root password:
```bash
# passwd
```

### Boot loader

Config `grub`:
```bash
# grub-install --target=x86_64-efi --efi-directory=/boot/efi
# grub-mkconfig -o /boot/grub/grub.cfg
```

## Reboot

Exit the chroot environment by typing `exit` or pressing `Ctrl+d`.

Finally, restart the machine by typing `reboot`: any partitions still mounted will be automatically unmounted by systemd. Remember to remove the installation medium and then login into the new system with the root account.

## Post-installation

### Disable Beep Sound

Edit `/etc/modprobe.d/nobeep.conf`:
```
blacklist pcspkr
```

### Users and groups

To add a new user named `t1k`, creating its home directory and otherwise using all the defaults in terms of groups, directory names, shell used and various other parameters:
```bash
# useradd -m t1k
# passwd t1k
```

After that it's interesting to give pemissions:
```bash
# export EDITOR=nvim
# visudo
```

### Enable Internet

```bash
# systemctl start dhcpcd.service
# systemctl enable dhcpcd.service
# systemctl start iwd.service
# systemctl enable iwd.service
# iwctl
```

### Logout

### Installing dotfiles

1. Clone this repository:
```bash
# git clone https://github.com/T16K/dotfiles.git
```
2. Run the scripts.

### Set localectl

```bash
# localectl set-x11-keymap br
# export LC_ALL=pt_BR.UTF-8
```

### Test xinit

```bash
# startx
```
