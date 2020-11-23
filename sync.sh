#!/bin/bash
cd /mnt/socoding/mirror-sync
for distro in "archlinux" "archlinuxcn" "manjaro"
do
    ./bfsu-rsync.sh ${distro}
done


distro="ubuntu"
dist="focal,focal-updates,focal-security,focal-backports,focal-proposed,groovy,groovy-updates,groovy-security,groovy-backports,groovy-proposed"
section="main,multiverse,universe,restricted"
./ustc-debmirror.sh ${distro} ${dist} ${section}

distro="debian"
dist="buster,buster-updates,buster-proposed-updates,buster-backports"
section="main,contrib,non-free"
./ustc-debmirror.sh ${distro} ${dist} ${section}

distro="debian-security"
dist="buster/updates"
section="main,contrib,non-free"
./ustc-debmirror.sh ${distro} ${dist} ${section}