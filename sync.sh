#!/bin/bash
cd /mnt/socoding/mirror-sync
for distro in "archlinux" "archlinuxcn" "gentoo-portage" "manjaro"
do
    ./bfsu-rsync.sh ${distro}
done