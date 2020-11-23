#!/bin/bash
debmirror /mnt/socoding/files/debian \
    --host=mirrors.bfsu.edu.cn \
    --root=debian \
    --arch=amd64 \
    --dist=buster,buster-updates,buster-proposed-updates \
    --verbose \
    --section=main,contrib,non-free \
    --method=rsync \
    --nosource \
    --ignore-release-gpg \
    --ignore-small-errors
