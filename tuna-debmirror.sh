#!/bin/bash

distro=${1}
dist=${2}
section=${3}

debmirror /mnt/socoding/files/${distro} \
    --host=mirrors.tuna.tsinghua.edu.cn \
    --root=${distro} \
    --arch=amd64 \
    --dist=${dist} \
    --verbose \
    --section=${section} \
    --method=rsync \
    --nosource \
    --ignore-release-gpg \
    --ignore-small-errors \
    --progress

touch /mnt/socoding/files/${distro}
echo "Last sync was $(LC_ALL=C date)" >> /mnt/socoding/mirror-log/${distro}.log