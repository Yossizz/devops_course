#!/bin/bash
apt install nfs-kernel-server -y
mkdir -p /mnt/nfs_share
chown -R nobody:nogroup /mnt/nfs_share/
chmod 777 /mnt/nfs_share/
echo "/mnt/nfs_share  *(rw,sync,no_subtree_check,no_root_squash,insecure)" >> /etc/exports
exportfs -a
systemctl restart nfs-kernel-server
ufw disable
