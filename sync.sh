#!/bin/bash
cd /mnt/socoding/mirror-sync
for distro in "archlinux" "archlinuxcn" "manjaro"
do
    ./bfsu-rsync.sh ${distro}
done


distro="ubuntu"
dist="focal,focal-updates,focal-security,focal-backports,focal-proposed,groovy,groovy-updates,groovy-security,groovy-backports,groovy-proposed,hirsute,hirsute-backports,hirsute-proposed,hirsute-security,hirsute-updates"
section="main,multiverse,universe,restricted"
./tuna-debmirror.sh ${distro} ${dist} ${section}

distro="debian"
dist="buster,buster-updates,buster-proposed-updates,buster-backports"
section="main,contrib,non-free"
./tuna-debmirror.sh ${distro} ${dist} ${section}

distro="debian-security"
dist="buster/updates"
section="main,contrib,non-free"
./tuna-debmirror.sh ${distro} ${dist} ${section}