### RClone

Best for uploading files to cloud storage (unidirectional).

```shell
sudo apt install rclone

rclone config

# forward config web port
ssh -L 53682:localhost:53682 -N -o GatewayPorts=yes 192.168.2.69
```

List content

```shell
# List directories in top level of your pCloud
rclone lsd pcloud-upstream:

# List all the files in your pCloud
rclone ls remote:

# To copy a local directory to a pCloud directory called backup
rclone copy ~/cloud-sync/pcloud-upstream/ pcloud-upstream:backup --progress --create-empty-src-dirs --bwlimit 4M:900k
```

```shell
rclone lsd pcloud-crypt:  # List directories in top level of your pCloud
rclone ls remote:  # List all the files in your pCloud
rclone copy ~/cloud-sync/pcloud-upstream/ pcloud-upstream:backup --progress --create-empty-src-dirs --bwlimit 4M:900k
```

### TODO number of threads / uploads transfers

```shell
--transfers=1
```

### Common commands

upstream pcloud-upstream to pcloud-upstream/<DIR>

```shell
# DANGER: Overwrites files in destination that are also in the source.
rclone copy ~/cloud-sync/pcloud-upstream/ pcloud-upstream:my_dir --create-empty-src-dirs

rclone copy TODO_src_dir pcloud-crypt:TODO_target_dir --progress --create-empty-src-dirs --bwlimit 10M:4M
rclone copy ~/disks/backup_fat/prn/ pcloud-crypt:prn --progress --create-empty-src-dirs --bwlimit 1.5M:400k
```

```shell
# DANGER: Make source and dest identical, modifying destination only.
# DANGER: Overwrites files in destination that changed in source.
# DANGER: deletes files if they don't exist in source.
rclone sync --create-empty-src-dirs


# bisync          Perform bidirectional synchronization between two paths.
# cat             Concatenates any files and sends them to stdout.
# check           Checks the files in the source and destination match.
# checksum        Checks the files in the source against a SUM file.
```

## DISKS

```shell
# Disk utilization
df -h
```

```shell
robinholzi@raspbi:/ $ lsblk

NAME        MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS
sda           8:0    0 223.6G  0 disk --> Extern SSD SanDisk
├─sda1        8:1    0    16M  0 part
└─sda2        8:2    0 223.6G  0 part
sdb           8:16   0   3.6T  0 disk --> family backup 4TB
├─sdb1        8:17   0    16M  0 part
├─sdb2        8:18   0   1.3T  0 part
└─sdb3        8:19   0   2.4T  0 part
sdc           8:32   0   7.3T  0 disk--> 8TB Backup HDD
└─sdc1        8:33   0   7.3T  0 part
mmcblk0     179:0    0  59.5G  0 disk
├─mmcblk0p1 179:1    0   512M  0 part /boot/firmware
└─mmcblk0p2 179:2    0    59G  0 part /


lsblk -f # for filesystems info
NAME        FSTYPE    FSVER LABEL          UUID                                 FSAVAIL FSUSE% MOUNTPOINTS
sda
├─sda1
├─sda2      ntfs            BackupsFamilie 38E65CF7E65CB6BA
└─sda3      BitLocker 2
sdb
└─sdb1      ext4      1.0   archive        53f1a418-f8a7-4800-9ec3-00669ec0e64a
mmcblk0
├─mmcblk0p1 vfat      FAT32 bootfs         4EF5-6F55                             453.9M    11% /boot/firmware
└─mmcblk0p2 ext4      1.0   rootfs         ce208fd3-38a8-424a-87a2-cd44114eb820   52.2G     5% /
```

### Mount CryptoLux

```shell
sudo apt-get install cryptsetup

sudo cryptsetup luksOpen /dev/sda1 encryted_vol

sudo mount /dev/mapper/encryted_vol ~/disks/mnt3

sudo umount /media/my_device
sudo cryptsetup luksClose my_encrypted_volume

```

### Mount disks deterministically

```shell
mkdir -p mkdir -p ~/disks/ext_sandisk_papa
sudo mount /dev/sda2  ~/disks/ext_sandisk_papa -t ntfs-3g

mkdir -p mkdir -p ~/disks/backup_fat
sudo mount /dev/sdb1  ~/disks/backup_fat -t ext4

mkdir -p mkdir -p ~/disks/backup_family
sudo mount /dev/sda2  ~/disks/backup_family -t ntfs-3g
```

Throttle speed:

```shell
sudo tc qdisc add dev wlan0 root handle 1: htb default 11
sudo tc class add dev wlan0 parent 1: classid 1:1 htb rate 1mbit ceil 1mbit
sudo tc filter add dev wlan0 protocol ip parent 1:0 prio 1 u32 match ip src 0.0.0.0/0 flowid 1:

sudo tc qdisc add dev wlan0 handle ffff: ingress
sudo tc filter add dev wlan0 parent ffff: protocol ip prio 1 u32 match ip dst 0.0.0.0/0 police rate 35mbit burst 10k

###

sudo tc qdisc add dev eth0 root handle 1: htb default 11
sudo tc class add dev eth0 parent 1: classid 1:1 htb rate 1mbit ceil 1mbit
sudo tc filter add dev eth0 protocol ip parent 1:0 prio 1 u32 match ip src 0.0.0.0/0 flowid 1:

sudo tc qdisc add dev eth0 handle ffff: ingress
sudo tc filter add dev eth0 parent ffff: protocol ip prio 1 u32 match ip dst 0.0.0.0/0 police rate 25mbit burst 10k


# sudo tc qdisc del dev <interface> root
# sudo tc qdisc del dev <interface> ingress
```

```shell
rclone copy ~/disks/backup_fat/_archives/documents/ pcloud-upstream:documents --progress --create-empty-src-dirs --bwlimit 2M:500k
rclone copy ~/disks/backup_fat/_archives/audiobooks/ pcloud-upstream:audiobooks --progress --create-empty-src-dirs --bwlimit 1M:200k
rclone copy ~/disks/backup_fat/_archives/devices/ pcloud-upstream:devices --progress --create-empty-src-dirs --bwlimit 1M:200k
```

<!--  -->
<!-- rclone copy ~/disks/backup_fat/_archives/videos/ pcloud-upstream:videos --progress --create-empty-src-dirs --bwlimit 1M:1M -->
<!-- rclone copy ~/disks/backup_fat/_archives/movies_series/ pcloud-crypt:movies_series --progress --create-empty-src-dirs --bwlimit 3M:300k -->

### Sizes

```shell
rclone size pcloud-crypt:movies_series
```

### Two local directories

```shell
rsync -avh --checksum ~/disks/backup_family ~/disks/backup_fat/backup_family
```

### Checksums

3. Checksum Validation with hashdeep or md5deep
   You can create and compare checksum manifests using hashdeep or md5deep.

Steps:

Generate checksums for the source:
bash
Code kopieren
hashdeep -c md5 -r /source/directory > source_checksums.txt
Verify checksums against the destination:
bash
Code kopieren
hashdeep -c md5 -r -v -k source_checksums.txt /destination/directory

# Samba Share

```bash
sudo apt install samba
whereis samba

sudo nano /etc/samba/smb.conf
```

```toml
[sambashare]
    comment = NAS disks
    path = /home/robinholzi/disks/
    read only = no
    browsable = yes
```

```bash
sudo service smbd restart
sudo ufw allow samba

sudo smbpasswd -a username

\\ip-address\sambashare

```

## Password env variable

```bash
export RCLONE_CONFIG_PASS='<password>'
```
